module Show::Crawler
  class Base

    def setup_capybara(url:)
      Capybara.run_server = false
      Capybara.current_driver = :selenium_headless
      Capybara.app_host = url
    end
  end
end
