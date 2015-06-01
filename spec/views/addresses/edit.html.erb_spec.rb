require 'rails_helper'

RSpec.describe "addresses/edit", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :state_id => 1,
      :city => "MyString",
      :street => "MyString",
      :zipcode => 1
    ))
  end

  it "renders the edit address form" do
    render

    assert_select "form[action=?][method=?]", address_path(@address), "post" do

      assert_select "input#address_state_id[name=?]", "address[state_id]"

      assert_select "input#address_city[name=?]", "address[city]"

      assert_select "input#address_street[name=?]", "address[street]"

      assert_select "input#address_zipcode[name=?]", "address[zipcode]"
    end
  end
end
