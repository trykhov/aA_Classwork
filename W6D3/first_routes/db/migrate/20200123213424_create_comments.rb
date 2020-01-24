class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.integer :artwork_id
      t.timestamps
    end

    add_index :comments, [:user_id, :artwork_id]
  end
end
