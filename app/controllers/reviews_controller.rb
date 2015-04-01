class ReviewsController < ApplicationController
  
  before_filter :has_movieuser_and_movie, :only => [:new, :create]
  
  protected
  def has_movieuser_and_movie
    unless @current_user
      flash[:warning] = 'You must be logged in to create a review.'
      redirect_to login_path
    end
    unless (@movie = Movie.find_by_id(params[:movie_id]))
      flash[:warning] = 'Review must be for an existing movie.'
      redirect_to movies_path
    end
  end

  public
  def new
    @review = @movie.reviews.build
    # raise @review.inspect


  end
  
  def create
    # since moviegoer_id is a protected attribute that won't get
    # assigned by the mass-assignment from params[:review], we set it
    # by using the << method on the association.  We could also
    # set it manually with review.moviegoer = @current_user.

    #raise params.to_yaml

    # content of params
    #    review:       
    #        potatoes: '3'
    #    movie_id: '2'
    

    # raise @current_user.to_yaml

    #@currrent_user.reviews.create(:potatoes => params[:review][:potatoes], :movie_id => params[:movie_id])

    @current_user.reviews << @movie.reviews.build(params[:review])
    redirect_to movie_path(@movie)
  end
end
