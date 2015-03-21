# == Schema Information
#
# Table name: movieusers
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  provider   :string(255)
#  uid        :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Movieuser < ActiveRecord::Base
  has_many :reviews 
  
  has_many :movies, :through => :reviews 

  attr_accessible :name, :provider, :uid

  def  self.from_omniauth(auth)
  	where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    
    Movieuser.create!(
      :provider => auth["provider"],
      :uid => auth["uid"],
      :name => auth["info"]["name"])
  end
end
