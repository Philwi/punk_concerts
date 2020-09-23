require 'capybara'
require 'capybara/dsl'

module Show::Crawler
  class KnoxPunk < Base
    include ::Capybara::DSL

    def initialize
      setup_capybara(url: 'https://knox.p-u-n-k.de/')
      get_data
    end

    def get_data
      visit("/db/index.php?action=suche&was=&allgemein=&gruppe=&plz=&ort=&umkreis=&tag=&monat=&jahr=")
      Nokogiri::HTML(page.html).css('table.erg tr').each do |row|
        tds = row.css('td')
        next if tds.blank?
        description = tds[0]&.text.strip
        postalcode = tds[1]&.text&.strip[0..4]
        city = tds[1]&.text&.strip[6..-1]
        planned_for = tds[2]&.text.strip.to_date
        source = 'https://knox.p-u-n-k.de/'
        params = {
          description: description,
          postalcode: postalcode,
          city: city,
          planned_for: planned_for,
          source: source,
          title: ''
        }
        ::Show::Operation::Create.(params: params)
      rescue => e
        pp "creating spot doesnt work: #{e}"
        next
      end
    end
  end
end