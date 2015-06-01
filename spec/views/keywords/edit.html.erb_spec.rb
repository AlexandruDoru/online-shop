require 'rails_helper'

RSpec.describe "keywords/edit", type: :view do
  before(:each) do
    @keyword = assign(:keyword, Keyword.create!(
      :key => "MyString",
      :product_id => 1
    ))
  end

  it "renders the edit keyword form" do
    render

    assert_select "form[action=?][method=?]", keyword_path(@keyword), "post" do

      assert_select "input#keyword_key[name=?]", "keyword[key]"

      assert_select "input#keyword_product_id[name=?]", "keyword[product_id]"
    end
  end
end
