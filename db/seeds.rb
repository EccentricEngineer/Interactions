# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require 'faker'

puts 'Seed: Deleting existing records...'

Channel.delete_all
Channeluser.delete_all
Message.delete_all
User.delete_all

puts 'Seed: Seeding...'

40.times do
  email = Faker::Internet.email
  username = Faker::Artist.name
  password = "123456"
  bio = Faker::Quote.matz
  picture_file = Faker::Avatar.image
  ig_tag = "ig_tag"

  new_user = User.new(email: email, username: username, password: password, bio: bio, ig_tag: ig_tag )
  new_user.profile_picture.attach(io: picture_file, filename: 'avatar.png', content_type: 'image/png')
  new_user.save

end

20.times do
  name = Faker::Hipster.word
  description = Faker::Hipster.sentence
  # start from here

  new_user = User.new(email: email, username: username, password: password, bio: bio, ig_tag: ig_tag )
  new_user.profile_picture.attach(io: picture_file, filename: 'avatar.png', content_type: 'image/png')
  new_user.save

end

puts 'Seed: Finished seeding!'
