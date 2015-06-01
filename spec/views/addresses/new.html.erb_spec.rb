require 'rails_helper'

RSpec.describe "addresses/new", type: :view do
  before(:each) do
    assign(:address, Address.new(
      :state_id => 1,
      :city => "MyString",
      :street => "MyString",
      :zipcode => 1
    ))
  end

  it "renders new address form" do
    render

    assert_select "form[action=?][method=?]", addresses_path, "post" do

      assert_select "input#address_state_id[name=?]", "address[state_id]"

      assert_select "input#address_city[name=?]", "address[city]"

      assert_select "input#address_street[name=?]", "address[street]"

      assert_select "input#address_zipcode[name=?]", "address[zipcode]"
    end
  end
end
