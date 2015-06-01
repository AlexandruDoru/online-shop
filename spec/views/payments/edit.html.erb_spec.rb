require 'rails_helper'

RSpec.describe "payments/edit", type: :view do
  before(:each) do
    @payment = assign(:payment, Payment.create!(
      :order_id => 1,
      :cardnumber => 1
    ))
  end

  it "renders the edit payment form" do
    render

    assert_select "form[action=?][method=?]", payment_path(@payment), "post" do

      assert_select "input#payment_order_id[name=?]", "payment[order_id]"

      assert_select "input#payment_cardnumber[name=?]", "payment[cardnumber]"
    end
  end
end
