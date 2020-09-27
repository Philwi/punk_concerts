class ShowReflex < ApplicationReflex
  def scroll(value, params)
    params = JSON.parse(params)
    limit = value / 150 + 10
    city = params.dig('show', 'city')

    @shows = Show.upcoming.where("city ILIKE ?", "%#{city}%").limit(limit)
  end
end