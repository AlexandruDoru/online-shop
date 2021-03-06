require 'rails_helper'

RSpec.describe "shipping_addresses/index", type: :view do
  before(:each) do
    assign(:shipping_addresses, [
      ShippingAddress.create!(
        :address_id => 1,
        :user_id => 2
      ),
      ShippingAddress.create!(
        :address_id => 1,
        :user_id => 2
      )
    ])
  end

  it "renders a list of shipping_addresses" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
