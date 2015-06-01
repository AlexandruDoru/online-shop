require 'rails_helper'

RSpec.describe "related_products/new", type: :view do
  before(:each) do
    assign(:related_product, RelatedProduct.new(
      :product_id => 1,
      :related_product_id => 1
    ))
  end

  it "renders new related_product form" do
    render

    assert_select "form[action=?][method=?]", related_products_path, "post" do

      assert_select "input#related_product_product_id[name=?]", "related_product[product_id]"

      assert_select "input#related_product_related_product_id[name=?]", "related_product[related_product_id]"
    end
  end
end
