class Admin::ProductsController < ApplicationController
  require 'date'

  layout "admin" 

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
    @title = 'Product Listing'
  end

  def show
    @title = 'Product'
  end

  def new
    @product = Product.new
    @product.description = Description.new
    @title = 'New Product'
  end

  def edit
    @title = 'Edit Product'
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_products_url, notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to admin_products_url, notice: 'Product was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url, notice: 'Product was successfully destroyed.' }
    end
  end

  def get_category
    @product_categories = MainCategory.find(params[:cat_id]).product_categories
  end

  def add_discount
    @title = 'Add Discount'
    @product = Product.find(params[:product_id])
  end

  def post_discount
    if Discount.create!(
      product_id: params[:product_id],
      value: params[:value],
      since_when: DateTime.parse(params[:since_when]),
      until_when: DateTime.parse(params[:until_when])
      )
      flash[:notice] = 'Discount was added'
      redirect_to admin_products_path
    else
      flash[:error] = 'There was an error'
      redirect_to :back
    end
  end

  def add_related_product
    @title = 'Add Related Product'
    @product = Product.find(params[:product_id])
  end

  def post_related_product
    if RelatedProduct.create!(
      product_id: params[:product_id],
      related_product_id: params[:related_product_id]
      )
      flash[:notice] = 'Related Product was added'
      redirect_to admin_products_path
    else
      flash[:error] = 'There was an error'
      redirect_to :back
    end
  end


  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :product_category_id, :image, :price, :quantity, description_attributes: [:description])
    end
end
