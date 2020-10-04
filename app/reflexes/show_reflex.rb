class ShowReflex < ApplicationReflex
  def scroll(value, params)
    params = JSON.parse(params)
    limit = value / 150 + 10
    city = params.dig('show', 'city')
    radius = params.dig('show', 'radius')

    @shows = ::Show::Util::Helper.search_shows(city: city, radius: radius, limit: limit)
  end
end