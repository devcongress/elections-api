class Error
  attr_accessor :errors

  def initialize
    @errors = []
  end

  def append(options)
    errors << Err.new(options)
    self
  end

  def empty?
    errors.empty?
  end

  def to_hash
    { "errors": errors }
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
