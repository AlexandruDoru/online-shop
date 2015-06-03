class Admin::DiscountsController < ApplicationController
  layout "admin" 
  before_action :set_discount, only: [:show, :edit, :update, :destroy]

  def index
    @discounts = Discount.all
    @title = 'Discounts Listing'
  end

  def show
    @title = 'Discount'
  end

  def new
    @discount = Discount.new(product_id: params[:product_id])
    @title = 'New Discount'
  end

  def edit
    @title = 'Edit Discount'
  end

  def create
    @discount = Discount.new(discount_params)
    respond_to do |format|
      if @discount.save
        format.html { redirect_to admin_discounts_path, notice: 'Discount was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @discount.update(discount_params)
        format.html { redirect_to admin_discounts_path, notice: 'Discount was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @discount.destroy
    respond_to do |format|
      format.html { redirect_to admin_discounts_url, notice: 'Discount was successfully destroyed.' }
    end
  end

  private
    def set_discount
      @discount = Discount.find(params[:id])
    end

    def discount_params
      params.require(:discount).permit(:value, :since_when, :until_when, :product_id)
    end
end
