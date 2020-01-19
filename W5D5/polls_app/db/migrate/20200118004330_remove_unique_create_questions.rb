class RemoveUniqueCreateQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_index :questions, :poll_id
  end
end
