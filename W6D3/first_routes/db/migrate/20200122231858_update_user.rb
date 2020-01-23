class UpdateUser < ActiveRecord::Migration[5.2]
  def change
    remove_columns :users, :name, :email
    add_column :users, :username, :text, uniqueness: true
  end
end
