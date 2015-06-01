require 'rails_helper'

RSpec.describe "descriptions/index", type: :view do
  before(:each) do
    assign(:descriptions, [
      Description.create!(
        :description => "MyText"
      ),
      Description.create!(
        :description => "MyText"
      )
    ])
  end

  it "renders a list of descriptions" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
