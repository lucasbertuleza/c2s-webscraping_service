module Scraping
  # Web scraping nas internas de produto do site da webmotors
  class WebmotorsService < Base
    # @return [Hash<Symbol,String>]
    def call(_)
      begin
        preco = driver.find_element(:css, "strong#vehicleSendProposalPrice").text
        descricao = driver.find_element(:css, "h1#VehicleBasicInformationTitle")
        modelo = descricao.find_element(tag_name: "strong").text
        info = descricao.find_element(tag_name: "span").text
        marca = descricao.text.gsub(/#{modelo}|#{info}/, "").strip
      rescue Selenium::WebDriver::Error::NoSuchElementError
        raise(VerificacaoCaptchaException) if captcha?
      ensure
        driver.quit
      end

      {marca:, modelo:, preco:, info:}.compact.presence || raise(DadosNaoEncontradosException)
    end

    private

    def captcha?
      driver.find_element(class: "px-captcha-container").displayed?
    rescue Selenium::WebDriver::Error::NoSuchElementError
      false
    end
  end
end
