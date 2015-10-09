class AddLongitudeToListings < ActiveRecord::Migration
  def change
    add_column :listings, :longitude, :decimal
  end
end
