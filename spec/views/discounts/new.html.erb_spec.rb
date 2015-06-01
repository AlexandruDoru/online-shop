require 'rails_helper'

RSpec.describe "discounts/new", type: :view do
  before(:each) do
    assign(:discount, Discount.new(
      :value => 1,
      :product_id => 1
    ))
  end

  it "renders new discount form" do
    render

    assert_select "form[action=?][method=?]", discounts_path, "post" do

      assert_select "input#discount_value[name=?]", "discount[value]"

      assert_select "input#discount_product_id[name=?]", "discount[product_id]"
    end
  end
end
