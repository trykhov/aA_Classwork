# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint           not null, primary key
#  question_id :integer
#  user_id     :integer
#  text        :text
#

class AnswerChoice < ApplicationRecord
  validates :text, presence: true 
end 
