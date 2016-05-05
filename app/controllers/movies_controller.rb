# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController

  def index
  case params[:sort]
    when 'title'
      @movies = Movie.order('title ASC')
      @title_hilite = 'hilite'
    when 'release'
      @movies = Movie.order('release_date ASC')
      @release_hilite = 'hilite'
    else
      @movies = Movie.all
    end
  end

  def show
    id = params[:id] 
    @movie = Movie.find(id) 
  end

  def new
  end

  def create
    debugger
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
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