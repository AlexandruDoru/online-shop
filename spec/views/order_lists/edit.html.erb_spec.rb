require 'rails_helper'

RSpec.describe "order_lists/edit", type: :view do
  before(:each) do
    @order_list = assign(:order_list, OrderList.create!(
      :order_id => 1,
      :product_id => 1
    ))
  end

  it "renders the edit order_list form" do
    render

    assert_select "form[action=?][method=?]", order_list_path(@order_list), "post" do

      assert_select "input#order_list_order_id[name=?]", "order_list[order_id]"

      assert_select "input#order_list_product_id[name=?]", "order_list[product_id]"
    end
  end
end
