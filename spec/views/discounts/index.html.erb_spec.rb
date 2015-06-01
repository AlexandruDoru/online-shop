require 'rails_helper'

RSpec.describe "discounts/index", type: :view do
  before(:each) do
    assign(:discounts, [
      Discount.create!(
        :value => 1,
        :product_id => 2
      ),
      Discount.create!(
        :value => 1,
        :product_id => 2
      )
    ])
  end

  it "renders a list of discounts" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
