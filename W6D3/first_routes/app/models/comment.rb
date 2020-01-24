# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text
#  user_id    :integer
#  artwork_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord

  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User,
    dependent: :destroy

  belongs_to :artwork, 
    foreign_key: :artwork_id,
    class_name: :Artwork,
    dependent: :destroy
end
