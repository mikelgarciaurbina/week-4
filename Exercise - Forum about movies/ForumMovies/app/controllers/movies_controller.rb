class MoviesController < ApplicationController
  def index
    @movie = Movie.new
  end

  def search
    @search_word = params[:movie][:title]
    @movies = Movie.where("title LIKE ?", "%#{@search_word}%")
    if @movies.count > 0
      render "search"
    else
      results = Imdb::Search.new(@search_word)
      @movies = results.movies.first(20)
      render "search_imdb"
    end
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      flash.now[:alert] = "ERROR!"
      render "new"
    end
  end

  def show
    @movie = Movie.find_by(id: params[:id])
    @comments = @movie.comments
    @comment_new = Comment.new
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :poster, :year, :synopsis)
  end
end
