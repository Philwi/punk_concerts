module Show::Cell
  class Index < PunkConcerts::Cell::Layout
    include ::ActionView::Helpers::UrlHelper
    include ::ActionView::Helpers::AssetTagHelper

    def shows
      model
    end

    def next_shows
      Show.where('planned_for >= ?', Date.today).limit(3)
    end

    def params
      options.dig(:params).to_json
    end

  end
end
