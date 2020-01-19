# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  user_id          :integer
#  question_id      :integer
#  answer_choice_id :integer
#

class Response < ApplicationRecord
  validates :user_id, presence: true
  validates :question_id, presence: true
  validates :answer_choice_id, presence: true
end
