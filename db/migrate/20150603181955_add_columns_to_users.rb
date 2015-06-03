class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :address_id, :string
    add_column :users, :phone_number, :string
    add_column :users, :thumbnail, :attachment
  end
end
