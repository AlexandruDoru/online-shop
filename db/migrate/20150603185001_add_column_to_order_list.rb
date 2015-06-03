class AddColumnToOrderList < ActiveRecord::Migration
  def change
    add_column :order_lists, :quantity, :integer
  end
end
