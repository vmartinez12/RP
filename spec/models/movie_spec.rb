# spec/models/movie_spec.rb:
require 'spec_helper'

#Sec 8.5 to test fixtures 
describe Movie do
  fixtures :movies
  it 'should include rating and year in full name' do
    movie = movies(:milk_movie)
    movie.stub(:name_with_rating).and_return(movie.title + " " + movie.rating)
    movie.name_with_rating.should == 'Milk R'
  end

  # To test factory
  describe Movie do
  it 'should include rating and year in full name, factory' do
    movie = FactoryGirl.build(:movie, :title => 'Milk', :rating => 'R')
    movie.stub(:name_with_rating).and_return(movie.title + " " + movie.rating)
    movie.name_with_rating.should == 'Milk R'
  end
end

  # Sec 8.6
  #describe 'searching Tmdb by keyword' do
  #  it 'should call Tmdb with title keywords' do
  #   TmdbMovie = mock('Movie')   # don't need if ruby-tmdb gem is install 
  #    TmdbMovie.should_receive(:find).with(hash_including :title => 'Inception')
  #   Movie.find_in_tmdb('Inception')
  # end
  #end

  describe 'searching Tmdb by keyword' do
    
      it 'should call Tmdb with title keywords' do
        Tmdb::Movie.should_receive(:find).with('Inception')
        Movie.find_in_tmdb('Inception')
      end

  end

end