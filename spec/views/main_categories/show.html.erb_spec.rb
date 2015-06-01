require 'rails_helper'

RSpec.describe "main_categories/show", type: :view do
  before(:each) do
    @main_category = assign(:main_category, MainCategory.create!(
      :name => "Name",
      :description_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
  end
end
