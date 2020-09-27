module Show::Cell
  class Single < PunkConcerts::Cell::Layout
    include ::ActionView::Helpers::UrlHelper
    include ::ActionView::Helpers::AssetTagHelper

    ATTRIBUTES = [
      { attribute: :location, icon: 'home' },
      { attribute: :address, icon: 'location_city' },
      { attribute: :street, icon: 'add_road' },
      { attribute: :source, icon: 'link' },
    ]

    def image(image)
      image.attachment.present? ? image : 'goodnight.png'
    end

    def attributes
      ATTRIBUTES.map do |attribute|
        if model.public_send(attribute[:attribute]).present?
          content_tag(:span, class: 'icon-with-text') do
            capture do
              content_tag(:i, attribute[:icon], class: "material-icons") +
              content_tag(:p, model.public_send(attribute[:attribute]), class: 'card-text')
            end
          end
        end
      end.compact.join(content_tag(:br))
    end

  end
end