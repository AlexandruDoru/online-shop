require 'rails_helper'

RSpec.describe "order_lists/show", type: :view do
  before(:each) do
    @order_list = assign(:order_list, OrderList.create!(
      :order_id => 1,
      :product_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
