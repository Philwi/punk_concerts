class CreateContactTable < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :subject
      t.string :content
      t.string :email
      t.timestamps
    end
  end
end
