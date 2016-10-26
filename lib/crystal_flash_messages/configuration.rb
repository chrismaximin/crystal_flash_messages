module CrystalFlashMessages
  class Configuration
    attr_accessor :additional_classes
    attr_writer :configuration

    def initialize
      reset
      true
    end

    def reset
      @additional_classes = ''
    end
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end
end
