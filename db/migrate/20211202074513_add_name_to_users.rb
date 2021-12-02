class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :tel_number, :string
  end
end
