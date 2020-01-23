class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  # ruby magic
  has_many :artworks,  
    foreign_key: :artist_id
    # class_name: :Artwork

  has_many :shared_artworks,
    through: :viewers,
    source: :artwork 

  has_many :viewers,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare
end
