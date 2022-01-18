class AddImageToListing < ActiveRecord::Migration[6.1]
  def change
    add_column :listings, :image, :binary
  end
end
