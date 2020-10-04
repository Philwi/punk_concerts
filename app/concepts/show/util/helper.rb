module Show::Util::Helper
  class << self
    def search_shows(city:, radius:, limit: 10)
      if city.blank? && radius.blank?
        Show.upcoming.limit(limit)
      else
        radius = 5 if radius.blank?
        Show.upcoming.near(city, radius, units: :km).limit(limit)
      end
    end
  end
end