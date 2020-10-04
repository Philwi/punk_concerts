module Contact::Contract
  class Create < Reform::Form
    property :name
    property :subject
    property :content, presence: true
    property :email

    validates :content,  length: 5..50000
  end
end
