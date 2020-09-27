module Show::Cell
  class Index < PunkConcerts::Cell::Layout
    include ::ActionView::Helpers::UrlHelper
    include ::ActionView::Helpers::AssetTagHelper

    def shows
      model
    end

    def next_shows
      Show.upcoming_with_flyer.limit(3)
    end

    def params
      options.dig(:params).to_json
    end

  end
end
