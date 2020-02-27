class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

def index
  
    
    
    if (params[:ratings] == nil && session[:ratings] != nil) || (params[:sort] == nil && session[:sort] != nil)
      flash.keep
      redirect_to movies_path(ratings: session[:ratings] || params.permit[:ratings], sort: session[:sort] || params.permit[:sort])
    end
    
    session[:sort] = params[:sort]
    
    #working
    session[:ratings] = params[:ratings]
    
    
    if params[:ratings] != nil
      @aratings = ['G','PG','PG-13','R']
      @checked = Hash[['G','PG','PG-13','R'].map{|r|[ r, (params[:ratings].keys).include?(r)]}]
      @movies = Movie.where(rating: params[:ratings].keys)
    else
      @aratings = ['G','PG','PG-13','R']
      @checked = Hash[['G','PG','PG-13','R'].map{|r|[ r, ['G','PG','PG-13','R'].include?(r)]}]
      @movies = Movie.where(rating: ['G','PG','PG-13','R'])
    end
    
    if params[:sort] == "release_date" 
  		@movies = @movies.all.sort_by{|e| e[:release_date]}
    end
    if params[:sort] == "title" 
    		@movies = @movies.all.sort_by{|e| e[:title]}
    end
  	
end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
