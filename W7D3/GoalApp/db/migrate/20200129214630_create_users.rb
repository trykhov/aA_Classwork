class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.text :password_digest
      t.string :session_token
    end
  end
end
