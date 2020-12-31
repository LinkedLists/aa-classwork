# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ActiveRecord::Base.transaction do 

# end


User.destroy_all
user_1 = User.create(username: 'User_1', email: 'abc1@email.com')
user_2 = User.create(username: 'User_2', email: 'abc2@email.com')
user_3 = User.create(username: 'User_3', email: 'abc3@email.com')

Artwork.destroy_all
art_1 = Artwork.create(title: 'Bob Ross', image_url: 'ross.com', artist_id: user_1.id)
art_2 = Artwork.create(title: 'New Name', image_url: 'names.com', artist_id: user_3.id)
art_3 = Artwork.create(title: 'Another Art', image_url: 'artsy.com', artist_id: user_2.id)

ArtworkShare.destroy_all
as_1 = ArtworkShare.create(artwork_id: art_1.id, viewer_id: user_1.id)
as_2 = ArtworkShare.create(artwork_id: art_2.id, viewer_id: user_2.id)
as_3 = ArtworkShare.create(artwork_id: art_3.id, viewer_id: user_3.id)