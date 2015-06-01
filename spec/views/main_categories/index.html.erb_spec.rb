require 'rails_helper'

RSpec.describe "main_categories/index", type: :view do
  before(:each) do
    assign(:main_categories, [
      MainCategory.create!(
        :name => "Name",
        :description_id => 1
      ),
      MainCategory.create!(
        :name => "Name",
        :description_id => 1
      )
    ])
  end

  it "renders a list of main_categories" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
