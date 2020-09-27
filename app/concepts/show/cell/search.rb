module Show::Cell
  class Search < Trailblazer::Cell
    include ::SimpleForm::ActionViewExtensions::FormHelper
    include ::ActionView::Helpers::UrlHelper
    include ::ActionView::Helpers::AssetTagHelper
    include ::ActionView::Helpers::FormOptionsHelper
    include ::ActionView::Helpers::DateHelper

  end
end