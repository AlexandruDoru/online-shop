require 'rails_helper'

RSpec.describe "descriptions/show", type: :view do
  before(:each) do
    @description = assign(:description, Description.create!(
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
