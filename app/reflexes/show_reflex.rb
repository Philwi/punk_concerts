class ShowReflex < ApplicationReflex
  def scroll(value, params)
    params = JSON.parse(params)
    limit = value / 150 + 10
    city = params.dig('show', 'city')
    radius = params.dig('show', 'radius') || 0

    @shows = Show.upcoming.where("city ILIKE ?", "%#{city}%").near(city, radius, units: :km).limit(10)
  end
end