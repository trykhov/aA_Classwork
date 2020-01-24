# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :text
#  image_url  :text
#  artist_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
  validates :title, length: {maximum: 30}, presence: true, uniqueness: {
    scope: :artist_id,
    message: "Don't even think about it" # the same artist cannot have the same title for more than one piece
  }

  validates :image_url, :artist_id, presence: true

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

  has_many :artworks, 
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

  has_many :shared_viewers,
    through: :artworks,
    source: :viewer

  has_many :comments,
    foreign_key: :artwork_id,
    class_name: :Comment

end
