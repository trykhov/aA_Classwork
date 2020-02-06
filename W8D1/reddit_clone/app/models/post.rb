# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string
#  url        :string
#  content    :string
#  sub_id     :integer
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
    validates :title, :sub_id, presence: true

    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User 

    belongs_to :sub

    
end
