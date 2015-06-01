require 'rails_helper'

RSpec.describe "user_details/show", type: :view do
  before(:each) do
    @user_detail = assign(:user_detail, UserDetail.create!(
      :firstname => "Firstname",
      :lastname => "Lastname",
      :address_id => 1,
      :phone_number => "Phone Number",
      :thumbnail => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Firstname/)
    expect(rendered).to match(/Lastname/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(//)
  end
end
