require 'rails_helper'

RSpec.describe "shipping_addresses/new", type: :view do
  before(:each) do
    assign(:shipping_address, ShippingAddress.new(
      :address_id => 1,
      :user_id => 1
    ))
  end

  it "renders new shipping_address form" do
    render

    assert_select "form[action=?][method=?]", shipping_addresses_path, "post" do

      assert_select "input#shipping_address_address_id[name=?]", "shipping_address[address_id]"

      assert_select "input#shipping_address_user_id[name=?]", "shipping_address[user_id]"
    end
  end
end
