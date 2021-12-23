class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :listings, :Title, :title
    rename_column :listings, :Status, :status
    rename_column  :listings, :Listing_Type, :listing_type
    rename_column :listings, :Price, :price
    rename_column :listings, :Description, :description
  end
end
