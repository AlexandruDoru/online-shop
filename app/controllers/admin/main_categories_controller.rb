class Admin::MainCategoriesController < ApplicationController
  layout "admin" 
  before_action :set_main_category, only: [:show, :edit, :update, :destroy]

  def index
    @main_categories = MainCategory.all
    @title = 'Main Categories Listing'
  end

  def show
    @title = 'Main Category'
  end

  def new
    @main_category = MainCategory.new
    @main_category.description = Description.new
    @title = 'New Main Category'
  end

  def edit
    @title = 'Edit Main Category'
  end

  def create
    @main_category = MainCategory.new(main_category_params)
    respond_to do |format|
      if @main_category.save
        format.html { redirect_to admin_main_categories_path, notice: 'Main category was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @main_category.update(main_category_params)
        format.html { redirect_to admin_main_categories_path, notice: 'Main category was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @main_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_main_categories_url, notice: 'Main category was successfully destroyed.' }
    end
  end

  private
    def set_main_category
      @main_category = MainCategory.find(params[:id])
    end

    def main_category_params
      params.require(:main_category).permit(:name, description_attributes: [:description])
    end
end
