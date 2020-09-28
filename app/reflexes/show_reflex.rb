class ShowReflex < ApplicationReflex
  def scroll(value, params)
    params = JSON.parse(params)
    limit = value / 150 + 10
    city = params.dig('show', 'city')
    radius = params.dig('show', 'radius')

    @shows =
      if city.blank? && radius.blank?
        Show.upcoming.limit(limit)
      else
        radius = 0 if radius.blank?
        Show.upcoming.near(city, radius, units: :km).limit(limit)
      end
  end
end