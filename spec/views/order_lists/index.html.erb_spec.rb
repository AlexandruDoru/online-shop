require 'rails_helper'

RSpec.describe "order_lists/index", type: :view do
  before(:each) do
    assign(:order_lists, [
      OrderList.create!(
        :order_id => 1,
        :product_id => 2
      ),
      OrderList.create!(
        :order_id => 1,
        :product_id => 2
      )
    ])
  end

  it "renders a list of order_lists" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
