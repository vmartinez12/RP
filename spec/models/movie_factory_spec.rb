# spec/models/movie_factory_spec.rb
require 'spec_helper'

describe Movie do
  it 'should include rating and year in full name' do
    movie = FactoryGirl.build(:movie, :title => 'Milk', :rating => 'R')
    movie.stub(:name_with_rating).and_return(movie.title + " " + movie.rating)
    movie.name_with_rating.should == 'Milk R'
  end
end

# or if you mix in FactoryGirl's syntax methods (see FactoryGirl README):

#describe Movie do
#  subject {create :movie, :title => 'Milk', :rating => 'R'}
#  its :name_with_rating { should == 'Milk (R)' }
#end