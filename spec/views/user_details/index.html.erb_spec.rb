require 'rails_helper'

RSpec.describe "user_details/index", type: :view do
  before(:each) do
    assign(:user_details, [
      UserDetail.create!(
        :firstname => "Firstname",
        :lastname => "Lastname",
        :address_id => 1,
        :phone_number => "Phone Number",
        :thumbnail => ""
      ),
      UserDetail.create!(
        :firstname => "Firstname",
        :lastname => "Lastname",
        :address_id => 1,
        :phone_number => "Phone Number",
        :thumbnail => ""
      )
    ])
  end

  it "renders a list of user_details" do
    render
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
