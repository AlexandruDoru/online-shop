require 'rails_helper'

RSpec.describe "main_categories/edit", type: :view do
  before(:each) do
    @main_category = assign(:main_category, MainCategory.create!(
      :name => "MyString",
      :description_id => 1
    ))
  end

  it "renders the edit main_category form" do
    render

    assert_select "form[action=?][method=?]", main_category_path(@main_category), "post" do

      assert_select "input#main_category_name[name=?]", "main_category[name]"

      assert_select "input#main_category_description_id[name=?]", "main_category[description_id]"
    end
  end
end
