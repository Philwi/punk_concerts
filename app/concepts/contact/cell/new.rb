module Contact::Cell
  class New < PunkConcerts::Cell::Layout
    include ::SimpleForm::ActionViewExtensions::FormHelper
    include ::ActionView::Helpers::UrlHelper
    include ::ActionView::Helpers::AssetTagHelper
    include ::ActionView::Helpers::FormOptionsHelper
    include ::Recaptcha::Adapters::ViewMethods
  end
end