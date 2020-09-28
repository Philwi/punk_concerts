class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.string :name
      t.timestamps
    end

    add_reference :comments, :show, foreign_key: true
  end
end
