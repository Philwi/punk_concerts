module Show::Contract
  class Create < Reform::Form
    property :city, presence: true
    property :description, presence: true
    property :flyer, virtual: true
    property :location
    property :planned_for, presence: true
    property :postalcode
    property :source
    property :street
    property :title, presence: true

    validate do
      if flyer.present?
        errors.add(:flyer) << :no_image unless flyer.content_type.match(/image/)
      end
    end

    validates :title,  length: 5..50
    validates :description,  length: 5..500
    validates :city,  length: 3..50


    def title=(value)
      if value.present?
        super value
      else
        super input_params[:description].lines[0..1].join.chomp
      end
    end
  end
end