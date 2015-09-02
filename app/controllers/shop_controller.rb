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
    @main_category = @product_category.main_category
  end

  def product
    @product = Product.find(params[:id])
    @product_category = @product.product_category
        @main_category = @product_category.main_category

  end

  def add_to_cart
    @added = @order.add_to_order_list(params[:id], params[:quantity], current_user)
  end

  def delete_from_cart
    @order.delete_from_order_list(params[:id])
  end

  def checkout
    @payment = Payment.new
  end

  def pay
    @payment = Payment.new(
      stripe_card_token: params[:stripe_card_token],
      cardnumber: params[:card_number],
      order_id: params[:order_id]
    )
    Order.find(params[:order_id]).update_attributes(shipping_address_id: params[:shipping_address_id])
    if @payment.save_with_payment(current_user.email)
      session.delete(:order_id)
      redirect_to root_path, :notice => "Thank you for buying!"
    else
      redirect_to :back
    end
  end

  def customer
    @customer = User.find(params[:id])
  end

  def add_address
    @customer = User.find(params[:id])
  end

  def create_address
    @address = Address.new(state_id: 1, city: params[:city], street: params[:street], zipcode: params[:zipcode])
    if @address.save
      if ShippingAddress.create(user_id: params[:user_id], address_id: @address.id)
        redirect_to checkout_path, :notive => 'Address added'
      else
        redirect_to :back, :error => 'There was an error'
      end
    else
      redirect_to :back, :error => 'There was an error'
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