class SessionsController < ApplicationController

  # skip_before_filter :require_login, only: [:new, :create]
  # before_filter :disable_if_signed_in, only: [:new]

  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email].downcase)
    if @user.present? && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "You are successfully signed in"
      redirect_to documents_path
    else
      flash[:error] = "Your sign in information was incorrect. Please try again."
      redirect_to :back
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path
  end

end