class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.float :acres
      t.float :price
      t.text :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
