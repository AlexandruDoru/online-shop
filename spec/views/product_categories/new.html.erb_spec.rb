require 'rails_helper'

RSpec.describe "product_categories/new", type: :view do
  before(:each) do
    assign(:product_category, ProductCategory.new(
      :image => "",
      :name => "MyString",
      :description_id => 1,
      :main_category_id => 1
    ))
  end

  it "renders new product_category form" do
    render

    assert_select "form[action=?][method=?]", product_categories_path, "post" do

      assert_select "input#product_category_image[name=?]", "product_category[image]"

      assert_select "input#product_category_name[name=?]", "product_category[name]"

      assert_select "input#product_category_description_id[name=?]", "product_category[description_id]"

      assert_select "input#product_category_main_category_id[name=?]", "product_category[main_category_id]"
    end
  end
end
