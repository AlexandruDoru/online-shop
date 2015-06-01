require 'rails_helper'

RSpec.describe "product_attributes/edit", type: :view do
  before(:each) do
    @product_attribute = assign(:product_attribute, ProductAttribute.create!(
      :price => 1,
      :quantity => 1,
      :product_id => 1
    ))
  end

  it "renders the edit product_attribute form" do
    render

    assert_select "form[action=?][method=?]", product_attribute_path(@product_attribute), "post" do

      assert_select "input#product_attribute_price[name=?]", "product_attribute[price]"

      assert_select "input#product_attribute_quantity[name=?]", "product_attribute[quantity]"

      assert_select "input#product_attribute_product_id[name=?]", "product_attribute[product_id]"
    end
  end
end
