class MoviesController < ApplicationController

  def home

  end

  def all
   @movies = Movie.all
   render json: @movies
  end

  def search
    if params[:t]
      @movie = Movie.where(:title => params[:t])
    elsif params[:y]
      @movie = Movie.where(:year => params[:y])
    elsif params[:t] && params[:y]
      @movie = Movie.where(:year => params[:y], :title => params[:t])
    end
    render json: @movie
  end

end
