class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :hometown, :city
  end
end
