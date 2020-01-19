class CreateAnswerChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :answer_choices do |t|
      t.integer :question_id
      t.integer :user_id
      t.text :text 
    end
  end
end
