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
        render status: :unprocessable_entity
      end
    end
  end

  def verify_accept_header
    unless request.accept.blank?
      unless
        %w(application/vnd.api+json application/json).include?(request.accept)
        render status: :not_acceptable
      end
    end
  end
end
