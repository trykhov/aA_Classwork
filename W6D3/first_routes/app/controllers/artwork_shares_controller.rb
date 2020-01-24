class ArtworkSharesController < ApplicationController

  def create
    artshare = ArtworkShare.new(params.require(:artwork_share).permit(:artwork_id, :viewer_id))
    if artshare.save
      render json: artshare
    else
      render json: artshare.errors.full_messages, status: 418
    end
  end

  def destroy
    artshare = ArtworkShare.find_by(id: params[:id])
    artshare.destroy
    render json: artshare
  end


end
