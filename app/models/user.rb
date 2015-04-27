class User < ActiveRecord::Base

 	has_secure_password		
  	attr_accessible :name, :email, :password , :password_confirmation , :admin 
  	validates_uniqueness_of :email 

  

end
