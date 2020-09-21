class CreateShows < ActiveRecord::Migration[6.0]
  def change
    create_table :shows do |t|
      t.string :title
      t.string :description
      t.string :location
      t.string :city
      t.string :postalcode
      t.string :street
      t.string :source
      t.date :planned_for
      t.timestamps
    end
  end
end
