# == Schema Information
#
# Table name: questions
#
#  id      :bigint           not null, primary key
#  poll_id :integer
#  text    :string
#

class Question < ApplicationRecord
  validates :poll_id, presence: true
  validates :text, presence: true

  belongs_to :poll, 
    
end
