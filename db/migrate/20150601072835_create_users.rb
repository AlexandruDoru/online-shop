class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :role
      t.string :firstname
      t.string :lastname
      t.integer :address_id
      t.string :phone_number
      t.attachment :thumbnail
      
      t.timestamps null: false
    end
  end
end
