class CreateShippingAddresses < ActiveRecord::Migration
  def change
    create_table :shipping_addresses do |t|
      t.integer :address_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
