class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  rescue_from ActiveRecord::RecordNotFound, :with => :do_404_error
  def do_404_error
    redirect_to "/404.html"
    return
  end
  
end
