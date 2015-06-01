require 'rails_helper'

RSpec.describe "shipping_addresses/edit", type: :view do
  before(:each) do
    @shipping_address = assign(:shipping_address, ShippingAddress.create!(
      :address_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit shipping_address form" do
    render

    assert_select "form[action=?][method=?]", shipping_address_path(@shipping_address), "post" do

      assert_select "input#shipping_address_address_id[name=?]", "shipping_address[address_id]"

      assert_select "input#shipping_address_user_id[name=?]", "shipping_address[user_id]"
    end
  end
end
