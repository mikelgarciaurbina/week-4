class CommentsController < ApplicationController
  def create
    @movie = Movie.find_by(id: params[:id])
    
    @comment = @movie.comments.new(
      comment: params[:comment][:comment])
    @comment.user_id = session[:user_id]
    @comment.save
    redirect_to movie_path(@movie)
  end
end
