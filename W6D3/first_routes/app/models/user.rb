# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :text
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  # ruby magic
  has_many :artworks,  
    foreign_key: :artist_id,
    dependent: :destroy
    # class_name: :Artwork

  has_many :viewers, 
    foreign_key: :viewer_id,
    class_name: :ArtworkShare

  has_many :shared_artworks, 
    through: :viewers,
    source: :artwork,
    dependent: :destroy

  has_many :comments,
    foreign_key: :user_id,
    class_name: :Comment
end
