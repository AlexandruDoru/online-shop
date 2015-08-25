class SessionsController < ApplicationController

  before_filter :disable_if_signed_in, only: [:new]
  layout 'session'

  def new
    respond_to do |format|
      format.html
      format.js { render :js => "window.location = '/sessions/new'" }
    end
  end

  def create
    @user = User.find_by_email(params[:session][:email].downcase)
    if @user.present? && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      session[:order_id] = @user.orders.last.id if @user.orders.any? 
      flash[:success] = "You are successfully signed in"
      redirect_to root_path
    else
      flash[:error] = "Your sign in information was incorrect. Please try again."
      redirect_to :back
    end
  end

  def destroy
    session.delete(:user_id)
    session.delete(:order_id)
    redirect_to root_path
  end

end