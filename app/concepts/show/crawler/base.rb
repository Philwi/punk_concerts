module Show::Crawler
  class Base

    def setup_capybara(url:)
      options = Selenium::WebDriver::Chrome::Options.new
      if Rails.env.production?
        Selenium::WebDriver::Chrome.path = ENV["GOOGLE_CHROME_SHIM"]
      end
      options.add_argument("--headless")
      options.add_argument("--disable-dev-shm-usage")
      options.add_argument("--no-sandbox")
      @driver = Selenium::WebDriver.for :selenium_chrome_headless, options: options
      Capybara.run_server = false
      Capybara.current_driver = @driver
      Capybara.app_host = url
    end
  end
end
