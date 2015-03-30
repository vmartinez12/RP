class MoviesController < ApplicationController

 before_filter :authorize, only: [:edit, :update]
 
 def index
    @movies = Movie.all
 end

 def show
  # raise params.inspect
  id = params[:id]        # retrieve movie ID from URI route
  @movie = Movie.find(id) # look up movie by unique ID
  # will render app/views/movies/show.html.haml by default
 end
  
 def create
    @movie = Movie.new(params[:movie])
    if @movie.save
      flash[:notice] = "#{@movie.title} was successfully created."
      redirect_to movies_path
    else
      render 'new' # note, 'new' template can access @movie's field values!
    end
  end
   
=begin  
  def new
	  # default: render 'new' template
  end
=end

  def new
      @movie = Movie.new
  end

  
=begin 
  def create
     @movie = Movie.create!(params[:movie])
     flash[:notice] = "#{@movie.title} was created!"
     redirect_to movies_path
  end 
=end 

 def edit
   @movie = Movie.find params[:id]
 end

=begin 
  def update
   @movie = Movie.find params[:id]
   @movie.update_attributes!(params[:movie])
   flash[:notice] = "#{@movie.title} was successfully updated."
   redirect_to movie_path(@movie)
  end
=end 

 def update
  @movie = Movie.find params[:id]
  if @movie.update_attributes(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  else
    render 'edit' # note, 'edit' template can access @movie's field values!
  end
  end


 def destroy
  @movie = Movie.find(params[:id])
  @movie.destroy
  flash[:notice] = "Movie '#{@movie.title}' deleted."
  redirect_to movies_path
 end

 def search_tmdb
  # hardwire to simulate failure
  flash[:warning] = "'#{params[:search_terms]}' was not found in TMDb."
  redirect_to movies_path
end

end
