class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.text :title # limit of 30 characters
      t.text :image_url
      t.integer :artist_id
      t.timestamps
    end
  end
end
