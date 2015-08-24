class ChangeCardNumberType < ActiveRecord::Migration
  def change
  	change_column :payments, :cardnumber,  :string
  end
end
