class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :timezone, :string
    add_column :users, :languate, :string
    add_column :users, :country, :string
  end
end
