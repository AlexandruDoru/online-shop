class Admin::OrdersController < ApplicationController
  layout "admin" 

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
    @title = 'Orders Listing'
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
    @title = 'Order'
  end
end
