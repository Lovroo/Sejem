class AddCategoryIdToListings < ActiveRecord::Migration[6.1]
  def change
    add_column :listings, :category_id, :integer
    add_index :listings, :category_id
    add_foreign_key :listings, :categories
  end
end
