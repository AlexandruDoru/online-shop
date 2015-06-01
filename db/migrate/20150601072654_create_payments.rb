class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :order_id
      t.integer :cardnumber

      t.timestamps null: false
    end
  end
end
