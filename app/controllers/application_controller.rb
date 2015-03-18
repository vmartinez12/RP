class ApplicationController < ActionController::Base

  before_filter :set_current_user
  protected # prevents method from being invoked by a route
  def set_current_user
  #I made thchange, book code didn't work for me
    
    @current_user ||= Movieuser.find(session[:user_id]) if session[:user_id]
   
  end

end
