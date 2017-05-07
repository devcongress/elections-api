class ApplicationController < ActionController::API
  after_action :set_content_type, except: [:destroy]
  before_action :verify_accept_header
  before_action :verify_content_type
  before_action :ensure_payload_conforms_to_jsonapi_format, only: [:create, :update]

  private

    def jsonapi_media_type
      "application/vnd.api+json".freeze
    end

    def prepare_error(error, status = :bad_request)
      error.messages.each do |attr, messages|
        # attr = :year
        messages.each_with_index do |message, i|
          code = Error::Codes.error_type_to_code(error.details[attr][i][:error])
          errors.append(
            status: status,
            source: "data/attributes/#{attr}",
            detail: "`#{attr.to_s}` #{message}",
             title: "#{error.details[attr][i][:error].to_s} parameter",
              code: code
          )
        end
      end
      errors
    end

    def set_content_type
      content_type = request.accept
      content_type = jsonapi_media_type if content_type.blank?
      response.content_type = content_type
    end

    def verify_content_type
      if %w(create update).include?(params[:action])
        unless request.content_type == jsonapi_media_type
          render status: :unsupported_media_type,
                   json: Error.new.append(
                     status: :unsupported_media_type,
                     detail: I18n.t("error.detail.unsupported_media_type"),
                      title: I18n.t("error.title.unsupported_media_type"),
                       code: Error::Codes::UNSUPPORTED_MEDIA_TYPE,
                      links: {
                        about: "http://jsonapi.org/format/#content-negotiation"
                      }
                   )
        end
      end
    end

    def verify_accept_header
      unless request.accept.blank?
        unless
          %w(application/vnd.api+json application/json).include?(request.accept)
          render status: :not_acceptable, json: Error.new.append(
            status: :not_acceptable,
            detail: I18n.t("error.not_acceptable"),
             title: "Wrong/missing Accept header",
              code: Error::Codes::BAD_ACCEPT_HEADER,
             links: {
               about: "http://jsonapi.org/format/#content-negotiation"
             }
          )
        end
      end
    end

    def ensure_payload_conforms_to_jsonapi_format
      unless params[:type]
        errors.append(
          source: :type,
          status: :unprocessable_entity,
           title: I18n.t("error.title.missing_resource_type"),
          detail: I18n.t("error.detail.missing_resource_type"),
            code: Error::Codes::MISSING_RESOURCE_TYPE
        )
      end
      unless params[:data] && params[:data][:attributes]
        errors.append(
          source: :data,
          status: :unprocessable_entity,
          detail: I18n.t("error.detail.missing_data_object"),
           title: I18n.t("error.title.missing_data_object"),
            code: Error::Codes::MISSING_DATA
        )
      end

      render status: :unprocessable_entity, json: errors unless errors.empty?
    end

    def errors
      @errors ||= Error.new
    end
end
