class ApplicationController < ActionController::API
  after_action :set_jsonapi_content_type, only: [:index, :show]
  before_action :verify_accept_header
  before_action :verify_content_type

  private

  def set_jsonapi_content_type
    response.content_type = "application/vnd.api+json"
  end

  def verify_content_type
    if %w(create update).include?(params[:action])
      unless request.content_type == "application/vnd.api+json"
        render status: :unprocessable_entity
      end
    end
  end

  def verify_accept_header
    unless request.headers["Accept"].blank?
      unless %w(
                application/vnd.api+json
                application/json
              ).include?(request.headers["Accept"])
        render status: :not_acceptable
      end
    end
  end
end
