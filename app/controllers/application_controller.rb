class ApplicationController < ActionController::Base
  include SessionsHelper
  # before_filter :require_login

  protect_from_forgery with: :exception

  private

  def disable_if_signed_in
    redirect_to documents_path if signed_in?
  end

  def require_login
    redirect_to new_session_path unless current_user
  end

end