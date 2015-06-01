class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.attachment :image
      t.string :name
      t.integer :description_id
      t.integer :main_category_id

      t.timestamps null: false
    end
  end
end
