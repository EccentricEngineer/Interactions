# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts 'Seed: Deleting existing records...'

Channel.delete_all
Channeluser.delete_all
Message.delete_all
User.delete_all

puts 'Seed: Seeding...'

20.times do

user1 = User.create!(
  name: "Malcolm",
  email: "yes@yes.yes",
  password: "1234567890",
)


studio1 = Studio.new(
  name: "Alexie's Studio",
  user: user1,
  address: "London",
  opening_hour: "2022-05-31 14:22:53.657840837 +0200",
  closing_hour: "2022-05-31 15:22:53.657840937 +0200",
  price: 200
)

file = URI.open('https://images.unsplash.com/photo-1598488035139-bdbb2231ce04?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80')
studio1.photo_url.attach(io: file, filename: 'nes.png', content_type: 'image/png')
studio1.save

puts 'Seed: Finished seeding!'
