module Show::Cell
  class Card < PunkConcerts::Cell::Layout
    include ::ActionView::Helpers::UrlHelper
    include ::ActionView::Helpers::AssetTagHelper

    def image(image)
      image.attachment.present? ? image : 'goodnight.png'
    end
  end
end