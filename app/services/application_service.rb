class ApplicationService
  def initialize(...)
    raise NotImplementedError, "(ApplicationService is an abstract class and cannot be instantiated.)"
  end

  # @sg-ignore
  def self.call(...)
    new(...).call(...)
  end
end
