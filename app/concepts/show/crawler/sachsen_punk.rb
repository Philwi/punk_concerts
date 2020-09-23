module Show::Crawler
  class SachsenPunk < Base
    def initialize
      setup_capybara(url: 'http://www.sachsenpunk.de/')
    end

    def get_data
      visit("/")
    end

  end
end