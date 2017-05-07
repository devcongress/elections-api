class V1::ElectionsController < ApplicationController
  before_action :parse_json_api_payload, only: [:create, :update]
  before_action :set_election,           only: [:show]

  def index
    render json: Election.all
  end

  def create
    election = Election.new(election_params)
    if election.save
      render status: :created, json: election
    else
      render status: :bad_request, json: prepare_error(election.errors)
    end
  end

  def show
    render json: @election
  end

  def update
  end

  def destroy
  end

  private

    def set_election
      @election = Election.find_by(id: params[:id])
      unless @election
        render status: :not_found
        return
      end
    end

    def parse_json_api_payload
      errors = Error.new
      resource_type = params[:type]
      unless resource_type && resource_type == "elections"
        render status: :unprocessable_entity, json: errors.append(
          status: :unprocessable_entity,
           title: I18n.t("error.title.bad_resource_type"),
          detail: I18n.t("error.detail.bad_resource_type"),
            code: Error::Codes::MISSING_RESOURCE_TYPE
        )
        return  # short if `type` is wrong/missing.
      end

      required_params = %w(year started-at ended-at)
      @body = ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: required_params)

      if @body.empty?
        errors.append(
          status: :unprocessable_entity,
          detail: I18n.t("error.detail.unproccessable_entity"),
           title: I18n.t("error.title.missing_required_parameter"),
            code: Error::Codes::MISSING_PARAMETER
        )
      else
        missing_params = required_params.select { |p| !@body.key? p.underscore.to_sym }
        if missing_params.any?
          missing_params.each do |missing_param|
            errors.append(
              status: :unprocessable_entity,
              detail: "Missing `#{missing_param}`, a required parameter",
               title: I18n.t("error.title.missing_required_parameter"),
                code: Error::Codes::MISSING_PARAMETER
            )
          end
        end
      end

      render status: :unprocessable_entity, json: errors unless errors.empty?
    end

    def election_params
      @body
    end
end
