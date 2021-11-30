class AddUserIdToListings < ActiveRecord::Migration[6.1]
  def change
    add_column :listings, :user_id, :integer
    add_index :listings, :user_id
    add_foreign_key :listings, :users
  end
end
