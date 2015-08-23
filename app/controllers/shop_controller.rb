class ShopController < ApplicationController
  before_filter :set_cart
  before_filter :require_login, only: [:add_to_cart, :delete_from_cart, :checkout]

  def index
    @main_categories = MainCategory.all
  end

  def main_category
    @main_category = MainCategory.find(params[:id])
  end

  def product_category
    @product_category = ProductCategory.find(params[:id])
  end

  def product
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @order.add_to_order_list(params[:id], params[:quantity], current_user)
  end

  def delete_from_cart
    @order.delete_from_order_list(params[:id])
  end

  def checkout
    @payment = Payment.new
  end

  def pay

    @payment = Payment.new(params[:subscription])
  if @payment.save_with_payment(current_user.email)
    redirect_to @payment, :notice => "Thank you for subscribing!"
  else
    render :new
  end
end

  private 

  def set_cart
    @order = Order.find(session[:order_id])     if signed_in?
  rescue ActiveRecord::RecordNotFound
      if signed_in?
        @order = Order.create(user_id: current_user.id)
        session[:order_id] = @order.id
      end
  end

end