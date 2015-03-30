class SessionsController < ApplicationController
# user shouldn't have to be logged in before logging in!
  skip_before_filter :set_current_user, :authorize 
  
  def new
    #user wants to log in 
  end 
  
  def find    
      
    #raise params.to_yaml
    
    #raise params[:user][:email].inspect

    user = User.find_by_email(params[:user][:email]) 

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      session[:provider] = nil   
      flash[:notice] = "logged in!" 
      redirect_to movies_path 
    else
      flash[:notice] = "Could not log in!" 
      redirect_to movies_path 
    end    

  end  


  def create
    auth=request.env["omniauth.auth"]
    user=Movieuser.find_by_provider_and_uid(auth["provider"],auth["uid"]) ||
      Movieuser.create_with_omniauth(auth)
    session[:user_id] = user.id
    session[:provider] = auth["provider"]
    redirect_to movies_path
  end
  
  def destroy
    session[:user_id] = nil 
    @current_user = nil 
    flash[:notice] = 'Logged out successfully.'
    redirect_to movies_path
  end
end