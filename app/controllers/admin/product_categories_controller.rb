class Admin::ProductCategoriesController < ApplicationController
  layout "admin" 

  before_action :set_product_category, only: [:show, :edit, :update, :destroy]

  def index
    @product_categories = ProductCategory.all
    @title = 'Product Categories Listing'
  end

  def show
    @title = 'Product'
  end

  def new
    @product_category = ProductCategory.new
    @product_category.description = Description.new
    @title = 'New Product'
  end

  def edit
    @title = 'Edit Product'
  end

  def create
    @product_category = ProductCategory.new(product_category_params)

    respond_to do |format|
      if @product_category.save
        format.html { redirect_to admin_product_categories_url, notice: 'Product category was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @product_category.update(product_category_params)
        format.html { redirect_to admin_product_categories_url, notice: 'Product category was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @product_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_product_categories_url, notice: 'Product category was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_category
      @product_category = ProductCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_category_params
      params.require(:product_category).permit(:image, :name, :main_category_id, description_attributes: [:description])
    end
end
