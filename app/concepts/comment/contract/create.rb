module Comment::Contract
  class Create < Reform::Form
    include ::Reform::Form::ActiveModel::ModelReflections

    property :name
    property :content, presence: true
    property :show_model, virtual: true

    validates :content,  length: 5..50000
  end
end
