class AddLatLngtoShows < ActiveRecord::Migration[6.0]
  def up
    add_column :shows, :longitude, :float
    add_column :shows, :latitude, :float
    add_index :shows, [:latitude, :longitude]

    get_geolocation_for_every_show
  end

  def down
    remove_column :shows, :lat, :float
    remove_column :shows, :lng, :float
  end

  def get_geolocation_for_every_show
    Show.all&.each do |show|
      results = Geocoder.search(show.city)
      next if results.empty?
      latitude, longitude = results.first.coordinates
      show.update(latitude: latitude, longitude: longitude)
    end
  end
end
