require 'rails_helper'

RSpec.describe "keywords/index", type: :view do
  before(:each) do
    assign(:keywords, [
      Keyword.create!(
        :key => "Key",
        :product_id => 1
      ),
      Keyword.create!(
        :key => "Key",
        :product_id => 1
      )
    ])
  end

  it "renders a list of keywords" do
    render
    assert_select "tr>td", :text => "Key".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
