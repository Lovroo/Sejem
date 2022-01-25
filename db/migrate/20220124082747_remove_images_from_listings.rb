class RemoveImagesFromListings < ActiveRecord::Migration[6.1]
  def change
    remove_column :listings, :image
  end
end
