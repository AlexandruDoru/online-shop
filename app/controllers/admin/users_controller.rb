class Admin::UsersController < ApplicationController
  layout "admin" 
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    @title = 'Users Listing'
  end

  def show
    @title = 'User'
  end

  def edit
    @title = 'Edit User'
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_users_path }
        flash[:notice] = 'User was successfully updated.'
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'User was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:product_category).permit(:image, :name, :main_category_id, description_attributes: [:description])
    end
end
