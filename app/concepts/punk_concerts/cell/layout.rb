module PunkConcerts
  module Cell
    class Layout < Trailblazer::Cell
      include ::Cell::Slim
      include ::ActionView::Helpers::CsrfHelper
      include ::ActionView::Helpers::JavaScriptHelper
      include ::ActionView::Helpers::TranslationHelper
      include ::Cell::Translation
      include ::Webpacker::Helper
      include ::PunkConcerts::Util::Layout
    end
  end
end
