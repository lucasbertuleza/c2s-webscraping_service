module Scraping
  class Base < ApplicationService
    attr_reader :driver

    # @TODO: user-agents dinâmicos
    def initialize(url:, **args)
      options = Selenium::WebDriver::Chrome::Options.new(detach: true)
      @driver = Selenium::WebDriver.for(:remote, url: ENV["SELENIUM_REMOTE_URL"], options:)
      @driver.get(url)
    rescue Selenium::WebDriver::Error::InvalidArgumentError
      @driver.quit
      raise URLInvalidaException, url, caller, cause: nil
    end
  end

  class URLInvalidaException < StandardError
    def initialize(url) = super("URL mal formada: #{url}")
  end

  class DadosNaoEncontradosException < StandardError
    def initialize(message = "Incapaz de recuperar os dados") = super
  end

  class VerificacaoCaptchaException < StandardError
    def initialize(message = "Bloqueado por verificação CAPTCHA") = super
  end
end
