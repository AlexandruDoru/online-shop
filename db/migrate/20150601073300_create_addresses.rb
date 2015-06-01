class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :state_id
      t.string :city
      t.string :street
      t.integer :zipcode

      t.timestamps null: false
    end
  end
end
