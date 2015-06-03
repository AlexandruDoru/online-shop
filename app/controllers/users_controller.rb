class UsersController < ApplicationController

  layout 'session', only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have successfully registered"
      session[:user_id] = @user.id
      redirect_to root_path
    else 
      flash[:error] = @user.errors.full_messages.first
      redirect_to :back
    end
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end

end