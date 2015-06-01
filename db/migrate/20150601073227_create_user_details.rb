class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.string :firstname
      t.string :lastname
      t.integer :address_id
      t.string :phone_number
      t.attachment :thumbnail

      t.timestamps null: false
    end
  end
end
