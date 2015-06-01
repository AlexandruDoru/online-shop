require 'rails_helper'

RSpec.describe "product_attributes/index", type: :view do
  before(:each) do
    assign(:product_attributes, [
      ProductAttribute.create!(
        :price => 1,
        :quantity => 2,
        :product_id => 3
      ),
      ProductAttribute.create!(
        :price => 1,
        :quantity => 2,
        :product_id => 3
      )
    ])
  end

  it "renders a list of product_attributes" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
