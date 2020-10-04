class AddActiveToShow < ActiveRecord::Migration[6.0]
  def change
    add_column :shows, :active, :boolean, default: false
  end
end
