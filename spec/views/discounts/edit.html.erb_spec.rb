require 'rails_helper'

RSpec.describe "discounts/edit", type: :view do
  before(:each) do
    @discount = assign(:discount, Discount.create!(
      :value => 1,
      :product_id => 1
    ))
  end

  it "renders the edit discount form" do
    render

    assert_select "form[action=?][method=?]", discount_path(@discount), "post" do

      assert_select "input#discount_value[name=?]", "discount[value]"

      assert_select "input#discount_product_id[name=?]", "discount[product_id]"
    end
  end
end
