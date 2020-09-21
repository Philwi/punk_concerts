module Shows::Cell
  class Card < PunkConcerts::Cell::Layout
    include ::ActionView::Helpers::UrlHelper
    include ::ActionView::Helpers::AssetTagHelper
  end
end