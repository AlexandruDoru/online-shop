require 'rails_helper'

RSpec.describe "user_details/new", type: :view do
  before(:each) do
    assign(:user_detail, UserDetail.new(
      :firstname => "MyString",
      :lastname => "MyString",
      :address_id => 1,
      :phone_number => "MyString",
      :thumbnail => ""
    ))
  end

  it "renders new user_detail form" do
    render

    assert_select "form[action=?][method=?]", user_details_path, "post" do

      assert_select "input#user_detail_firstname[name=?]", "user_detail[firstname]"

      assert_select "input#user_detail_lastname[name=?]", "user_detail[lastname]"

      assert_select "input#user_detail_address_id[name=?]", "user_detail[address_id]"

      assert_select "input#user_detail_phone_number[name=?]", "user_detail[phone_number]"

      assert_select "input#user_detail_thumbnail[name=?]", "user_detail[thumbnail]"
    end
  end
end
