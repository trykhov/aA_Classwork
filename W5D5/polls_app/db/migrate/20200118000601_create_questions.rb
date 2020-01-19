class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.integer :poll_id
      t.string :text 
    end

    add_index :questions, :poll_id, unique: true 
  end
end
