class CreateProductAttributes < ActiveRecord::Migration
  def change
    create_table :product_attributes do |t|
      t.integer :price
      t.integer :quantity
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
