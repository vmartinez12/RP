class UsersController < ApplicationController

    skip_before_filter :set_current_user, :authorize 
    
	def new
			@user = User.new
	end
	
    def create

            # raise params.to_yaml

    		@user = User.new(params[:user])

    		if @user.save 
    			session[:user_id] = @user.id 
    			flash[:notice] = "Thank you for signing up."
    			redirect_to movies_path
    		else 	
    			flash[:notice] = "Could not sign up!" 
                render "new"
            end
    end         
end
