# == Schema Information
#
# Table name: movies
#
#  id           :integer         not null, primary key
#  title        :string(255)
#  rating       :string(255)
#  description  :text
#  release_date :datetime
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

class Movie < ActiveRecord::Base
  has_many :reviews

  has_many :movieuser, :through => :reviews 

  attr_accessible :title, :rating, :description, :release_date

  before_save :capitalize_title
  def capitalize_title
    self.title = self.title.split(/\s+/).map(&:downcase).
      map(&:capitalize).join(' ')
  end


  def self.all_ratings ; %w[G PG PG-13 R NC-17] ; end 
  # shortcut: array of strings
  
  validates :title, :presence => true
  validates :release_date, :presence => true
  validate :released_1930_or_later # uses custom validator below
  validates :rating, :inclusion => {:in => Movie.all_ratings},
    :unless => :grandfathered?
  
  def released_1930_or_later
    errors.add(:release_date, 'must be 1930 or later') if
      release_date && release_date < Date.parse('1 Jan 1930')
  end

  @@grandfathered_date = Date.parse('1 Nov 1968')
  
  def grandfathered?
    release_date && release_date < @@grandfathered_date
  end


   def self.find_in_tmdb(string)
   
      Tmdb::Movie.find(string)
  
  end

end
