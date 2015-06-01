class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :key
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
