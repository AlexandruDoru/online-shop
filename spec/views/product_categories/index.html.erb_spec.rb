require 'rails_helper'

RSpec.describe "product_categories/index", type: :view do
  before(:each) do
    assign(:product_categories, [
      ProductCategory.create!(
        :image => "",
        :name => "Name",
        :description_id => 1,
        :main_category_id => 2
      ),
      ProductCategory.create!(
        :image => "",
        :name => "Name",
        :description_id => 1,
        :main_category_id => 2
      )
    ])
  end

  it "renders a list of product_categories" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
