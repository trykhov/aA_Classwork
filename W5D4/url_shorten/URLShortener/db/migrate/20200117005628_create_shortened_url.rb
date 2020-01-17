class CreateShortenedUrl < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      # t.integer :id (already does it for us)
      t.string :long_url
      t.string :short_url
    end
    add_index :shortened_urls, :long_url, unique: true

  end
end
