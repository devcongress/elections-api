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
    # of the list and increment code for previous last error
    # to assign as number.
    UNSUPPORTED_MEDIA_TYPE = "600".freeze
    BAD_ACCEPT_HEADER      = "601".freeze
    MISSING_PARAMETER      = "602".freeze
    MISSING_RESOURCE_TYPE  = "603".freeze
    PARAMETER_TAKEN        = "604".freeze
    WRONG_RESOURCE_TYPE    = "605".freeze
    MISSING_DATA           = "606".freeze



    # Converts ActiveRecord validation errors to our
    # custom error codes. Expand to include more error types.
    def self.error_type_to_code(type)
      case type
      when :taken then PARAMETER_TAKEN
      when :blank then MISSING_PARAMETER
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
