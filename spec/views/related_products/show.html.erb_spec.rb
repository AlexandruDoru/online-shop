require 'rails_helper'

RSpec.describe "related_products/show", type: :view do
  before(:each) do
    @related_product = assign(:related_product, RelatedProduct.create!(
      :product_id => 1,
      :related_product_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
