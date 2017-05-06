class ApplicationController < ActionController::API
  after_action :set_content_type, except: [:destroy]
  before_action :verify_accept_header
  before_action :verify_content_type

  private

    def set_content_type
      content_type = request.accept
      content_type = "application/vnd.api+json" if content_type.blank?
      response.content_type = content_type
    end

    def verify_content_type
      if %w(create update).include?(params[:action])
        unless request.content_type == "application/vnd.api+json"
          render status: :unsupported_media_type, json: Error.new.append(
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
end
