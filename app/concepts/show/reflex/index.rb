module Show::Reflex
  class Index < ApplicationReflex
    def scroll(value, params)
      binding.pry
      limit = value / 200 + 10
      city = params.dig('city')
      @shows = Show.upcoming.where("city ILIKE ?", "%#{city}%").limit(limit)
    end
  end
end