module ApplicationHelper
  def jsonapi_media_type
    "application/vnd.api+json"
  end

  def set_jsonapi_content_type
    response.content_type = request.accept
    response.content_type = jsonapi_media_type if response.content_type.blank?
  end

  def verify_content_type
    if %w(create update).include?(params[:action])
      unless request.content_type == jsonapi_media_type
        render status: :unprocessable_entity
      end
    end
  end

  def verify_accept_header
    puts "Accept", request.accept
    unless request.accept.blank?
      unless
        %w(application/vnd.api+json application/json).include?(request.accept)
        render status: :not_acceptable
      end
    end
  end
end
