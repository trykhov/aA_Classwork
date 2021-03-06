class CreatePolls < ActiveRecord::Migration[6.0]
  def change
    create_table :polls do |t|
      t.string :title
      t.integer :author_id 
    end

    add_index :polls, :author_id, unique: true 
  end
end
