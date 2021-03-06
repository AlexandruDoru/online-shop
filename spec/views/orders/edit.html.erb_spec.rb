require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :user_id => 1,
      :value => 1,
      :shipping_address_id => 1
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input#order_user_id[name=?]", "order[user_id]"

      assert_select "input#order_value[name=?]", "order[value]"

      assert_select "input#order_shipping_address_id[name=?]", "order[shipping_address_id]"
    end
  end
end
