class AddUserIdToListings < ActiveRecord::Migration[6.1]
  def change
    add_column :listings, :user_id, :reference
  end
end
