require 'rails_helper'

RSpec.describe "order_lists/new", type: :view do
  before(:each) do
    assign(:order_list, OrderList.new(
      :order_id => 1,
      :product_id => 1
    ))
  end

  it "renders new order_list form" do
    render

    assert_select "form[action=?][method=?]", order_lists_path, "post" do

      assert_select "input#order_list_order_id[name=?]", "order_list[order_id]"

      assert_select "input#order_list_product_id[name=?]", "order_list[product_id]"
    end
  end
end
