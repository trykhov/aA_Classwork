class ArtworkShare < ApplicationRecord
  validates :artwork_id, :viewer_id, presence: true, uniqueness: {
    scope: :artist_id,
    message: 'cant have two shared works'
  }

  belongs_to :viewer,
    foreign_key: :viewer_id,
    class_name: :User
  
  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork
end
