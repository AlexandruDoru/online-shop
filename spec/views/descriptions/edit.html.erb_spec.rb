require 'rails_helper'

RSpec.describe "descriptions/edit", type: :view do
  before(:each) do
    @description = assign(:description, Description.create!(
      :description => "MyText"
    ))
  end

  it "renders the edit description form" do
    render

    assert_select "form[action=?][method=?]", description_path(@description), "post" do

      assert_select "textarea#description_description[name=?]", "description[description]"
    end
  end
end
