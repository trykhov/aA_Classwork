class CommentsController < ApplicationController

  def index
    comment = Comment.all#(:id params[:id])
    render json: comment
  end
  
  def create
    artwork = Artwork.find_by(id: params[:artwork_id])
    comment = Comment.new(params.require(:comment).permit(:user_id, :artwork_id, :body))
    comment.save

    render json: comment
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    comment.destroy

    render json: comment
  end

end
