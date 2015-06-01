require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      :user_id => 1,
      :value => 1,
      :shipping_address_id => 1
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input#order_user_id[name=?]", "order[user_id]"

      assert_select "input#order_value[name=?]", "order[value]"

      assert_select "input#order_shipping_address_id[name=?]", "order[shipping_address_id]"
    end
  end
end