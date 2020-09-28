module Comment::Cell
  class New < PunkConcerts::Cell::Layout
    include ::SimpleForm::ActionViewExtensions::FormHelper
    include ::ActionView::Helpers::UrlHelper
    include ::ActionView::Helpers::AssetTagHelper
    include ::ActionView::Helpers::FormOptionsHelper
    include ::Recaptcha::Adapters::ViewMethods

    def show_model
      options[:show_model]
    end
  end
end