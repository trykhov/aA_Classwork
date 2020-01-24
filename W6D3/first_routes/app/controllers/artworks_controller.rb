class ArtworksController < ApplicationController

  def index
    if params.has_key?(:user_id)
      artwork = Artwork.where(artist_id: params[:user_id])
    else
      artwork = Artwork.all
    end
    render json: artwork
  end

end
