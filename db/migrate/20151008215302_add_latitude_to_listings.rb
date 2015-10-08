class AddLatitudeToListings < ActiveRecord::Migration
  def change 
    add_column :listings, :latitude, :decimal
  end
end
