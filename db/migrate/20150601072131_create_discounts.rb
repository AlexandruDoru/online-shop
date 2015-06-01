class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.integer :value
      t.date :since_when
      t.date :until_when
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
