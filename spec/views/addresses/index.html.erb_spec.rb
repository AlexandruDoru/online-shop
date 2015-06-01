require 'rails_helper'

RSpec.describe "addresses/index", type: :view do
  before(:each) do
    assign(:addresses, [
      Address.create!(
        :state_id => 1,
        :city => "City",
        :street => "Street",
        :zipcode => 2
      ),
      Address.create!(
        :state_id => 1,
        :city => "City",
        :street => "Street",
        :zipcode => 2
      )
    ])
  end

  it "renders a list of addresses" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
