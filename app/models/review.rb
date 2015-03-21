# == Schema Information
#
# Table name: reviews
#
#  id           :integer         not null, primary key
#  potatoes     :integer
#  comments     :text
#  movieuser_id :integer
#  movie_id     :integer
#

class Review < ActiveRecord::Base
  belongs_to :movie
  belongs_to :movieuser
  # attr_protected :movieuser_id # see text
  attr_accessible :potatoes, :comments , :movieuser_id, :movie_id

end
