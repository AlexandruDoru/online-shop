require 'rails_helper'

RSpec.describe "related_products/index", type: :view do
  before(:each) do
    assign(:related_products, [
      RelatedProduct.create!(
        :product_id => 1,
        :related_product_id => 2
      ),
      RelatedProduct.create!(
        :product_id => 1,
        :related_product_id => 2
      )
    ])
  end

  it "renders a list of related_products" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
