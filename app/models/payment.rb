class Payment < ActiveRecord::Base

attr_accessor :stripe_card_token

  def save_with_payment(email)
    if valid?
      customer = Stripe::Charge.create(
        :amount => Order.find(order_id).value * 100,
        :currency => "usd",
        :source => stripe_card_token, # obtained with Stripe.js
        :description => email
      )
      self.stripe_customer_token = customer.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end

end
