class CreateOrderLists < ActiveRecord::Migration
  def change
    create_table :order_lists do |t|
      t.integer :order_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
