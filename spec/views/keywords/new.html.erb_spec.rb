require 'rails_helper'

RSpec.describe "keywords/new", type: :view do
  before(:each) do
    assign(:keyword, Keyword.new(
      :key => "MyString",
      :product_id => 1
    ))
  end

  it "renders new keyword form" do
    render

    assert_select "form[action=?][method=?]", keywords_path, "post" do

      assert_select "input#keyword_key[name=?]", "keyword[key]"

      assert_select "input#keyword_product_id[name=?]", "keyword[product_id]"
    end
  end
end
