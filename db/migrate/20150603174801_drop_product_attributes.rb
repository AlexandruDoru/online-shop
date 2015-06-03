class DropProductAttributes < ActiveRecord::Migration
  def change
  	drop_table :product_attributes
  end
end
