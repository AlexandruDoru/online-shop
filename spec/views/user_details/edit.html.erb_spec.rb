require 'rails_helper'

RSpec.describe "user_details/edit", type: :view do
  before(:each) do
    @user_detail = assign(:user_detail, UserDetail.create!(
      :firstname => "MyString",
      :lastname => "MyString",
      :address_id => 1,
      :phone_number => "MyString",
      :thumbnail => ""
    ))
  end

  it "renders the edit user_detail form" do
    render

    assert_select "form[action=?][method=?]", user_detail_path(@user_detail), "post" do

      assert_select "input#user_detail_firstname[name=?]", "user_detail[firstname]"

      assert_select "input#user_detail_lastname[name=?]", "user_detail[lastname]"

      assert_select "input#user_detail_address_id[name=?]", "user_detail[address_id]"

      assert_select "input#user_detail_phone_number[name=?]", "user_detail[phone_number]"

      assert_select "input#user_detail_thumbnail[name=?]", "user_detail[thumbnail]"
    end
  end
end
