require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      :comment => "MyText",
      :user_id => 1,
      :product_id => 1
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "textarea#comment_comment[name=?]", "comment[comment]"

      assert_select "input#comment_user_id[name=?]", "comment[user_id]"

      assert_select "input#comment_product_id[name=?]", "comment[product_id]"
    end
  end
end
