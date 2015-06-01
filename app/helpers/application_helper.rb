module ApplicationHelper

  def flash_type(flash)
    if flash[:error].present? 
      'alert-danger'
    elsif flash[:success].present?
      'alert-success'
    end
  end
  
end
