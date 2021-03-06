require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :name => "MyString",
      :product_category_id => 1,
      :image => "",
      :description_id => 1
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input#product_name[name=?]", "product[name]"

      assert_select "input#product_product_category_id[name=?]", "product[product_category_id]"

      assert_select "input#product_image[name=?]", "product[image]"

      assert_select "input#product_description_id[name=?]", "product[description_id]"
    end
  end
end
