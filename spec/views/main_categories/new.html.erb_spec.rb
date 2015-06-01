require 'rails_helper'

RSpec.describe "main_categories/new", type: :view do
  before(:each) do
    assign(:main_category, MainCategory.new(
      :name => "MyString",
      :description_id => 1
    ))
  end

  it "renders new main_category form" do
    render

    assert_select "form[action=?][method=?]", main_categories_path, "post" do

      assert_select "input#main_category_name[name=?]", "main_category[name]"

      assert_select "input#main_category_description_id[name=?]", "main_category[description_id]"
    end
  end
end
