module Show::Contract
  class Create < Reform::Form
    property :title
    property :description, presence: true
    property :location
    property :city, presence: true
    property :postalcode
    property :street
    property :source
    property :planned_for, presence: true

    def title=(value)
      if value.present?
        super value
      else
        super input_params[:description].lines[0..1].join.chomp
      end
    end
  end
end