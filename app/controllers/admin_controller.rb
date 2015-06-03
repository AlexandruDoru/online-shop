class AdminController < ApplicationController
  layout "admin" 

  def dashboard
  	@title = 'Dashboard'
  end

end
