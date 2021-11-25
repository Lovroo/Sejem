class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :Title
      t.integer :Price
      t.string :Listing_Type
      t.string :Description
      t.string :Status

      t.timestamps
    end
  end
end
