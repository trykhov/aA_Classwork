# == Schema Information
#
# Table name: polls
#
#  id        :bigint           not null, primary key
#  title     :string
#  author_id :integer
#

class Poll < ApplicationRecord
  validates :author_id, presence: true, uniqueness: true 
  validates :title, presence: true 

  belongs_to :author, 
    primary_key: :id, 
    foreign_key: :author_id, 
    class_name: :User 

  has_many :questions, 
    primary_key: :id, 
    foreign_key: :poll_id, 
    class_name: :Question 
end
