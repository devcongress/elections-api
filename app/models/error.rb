class Error
  attr_accessor :errors

  def initialize
    @errors = []
  end

  def append(options)
    errors << Err.new(options)
    self
  end
  alias_method :<<, :append

  def empty?
    errors.empty?
  end

  def to_hash
    { "errors": errors }
  end

  module Codes
    # Custom codes for identifying errors.
    # During modification, add new error codes to the bottom
    # of the list. Number for new error is largest error number + 1
    UNSUPPORTED_MEDIA_TYPE = "600".freeze   # Any Content-Type other than `application/json`
                                            # and `application/vnd.api+json`
    BAD_ACCEPT_HEADER      = "601".freeze   # Any Accept other than `application/json` and
                                            # `application/vnd.api+json`
    MISSING_PARAMETER      = "602".freeze   # When a required parameter isn't given
    MISSING_RESOURCE_TYPE  = "603".freeze   # Payload doesn't have `type`
    PARAMETER_TAKEN        = "604".freeze   # Unique parameter but record exist with that value
    WRONG_RESOURCE_TYPE    = "605".freeze   # Resource type doesn't match what you want to create
    MISSING_DATA           = "606".freeze   # Payload doesn't have `data`
    INVALID_PARAMETER      = "607".freeze   # Invalid value for given parameter

    # Converts ActiveRecord validation errors to our
    # custom error codes. Expand to include more error types.
    def self.error_type_to_code(type)
      case type
      when :taken   then PARAMETER_TAKEN
      when :blank   then MISSING_PARAMETER
      when :invalid then INVALID_PARAMETER
      end
    end
  end
end

class Err
  attr_accessor :id, :links, :status, :code, :title, :detail, :source, :meta

  def initialize(options = {})
    @id     = options.delete(:id)
    @links  = options.delete(:links)
    @status = options.delete(:status)
    @code   = options.delete(:code)
    @title  = options.delete(:title)
    @detail = options.delete(:detail)
    @source = options.delete(:source)
    @meta   = options.delete(:meta)

    @status = Rack::Utils.status_code(@status).to_s if @status.is_a?(Symbol)
  end
end
