require 'rails_helper'

RSpec.describe "payments/new", type: :view do
  before(:each) do
    assign(:payment, Payment.new(
      :order_id => 1,
      :cardnumber => 1
    ))
  end

  it "renders new payment form" do
    render

    assert_select "form[action=?][method=?]", payments_path, "post" do

      assert_select "input#payment_order_id[name=?]", "payment[order_id]"

      assert_select "input#payment_cardnumber[name=?]", "payment[cardnumber]"
    end
  end
end
