# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  ArtworkShare.destroy_all
  Artwork.destroy_all
  User.destroy_all

  user_1 = User.create(username: 'master_chief')
  user_2 = User.create(username: 'noobmaster69')
  user_3 = User.create(username: 'doug')

  art_1 = Artwork.create(title: 'Cortona',image_url: "i'm a savage.png", artist_id: user_1.id)
  art_2 = Artwork.create(title: 'thor',image_url: "fat_thor.png", artist_id: user_2.id)
  art_3 = Artwork.create(title: 'anything',image_url: "pizza.png", artist_id: user_3.id)
  art_4 = Artwork.create(title: 'pizza',image_url: "collab.png", artist_id: user_2.id)

  ArtworkShare.create(artwork_id: art_1.id, viewer_id: user_1.id)
  ArtworkShare.create(artwork_id: art_1.id, viewer_id: user_2.id)
  ArtworkShare.create(artwork_id: art_4.id, viewer_id: user_3.id)
  ArtworkShare.create(artwork_id: art_3.id, viewer_id: user_2.id)
  ArtworkShare.create(artwork_id: art_3.id, viewer_id: user_1.id)


  Comment.create(body: "finish the fight", user_id: user_1.id, artwork_id: art_1.id)
end