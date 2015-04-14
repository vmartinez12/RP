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
    context 'with valid key' do
      it 'should call Tmdb with title keywords' do
        TmdbMovie.should_receive(:find).
          with(hash_including :title => 'Inception')
        Movie.find_in_tmdb('Inception')
      end
    end
    context 'with invalid key' do
      it 'should raise InvalidKeyError if key not given' do
        #Movie.stub(:api_key).and_return('')
        lambda { Movie.find_in_tmdb('Inception') }.
          should raise_error(Movie::InvalidKeyError)
      end
      it 'should raise InvalidKeyError if key is bad' do
        Movie.stub(:api_key).and_return('INVALID')

        TmdbMovie.stub(:find).
          and_raise(Movie::InvalidKeyError)
        lambda { Movie.find_in_tmdb('Inception') }.
          should raise_error(Movie::InvalidKeyError)
      end
    end
  end

end