# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require 'faker'
require 'resolv-replace'

puts 'Seed: Deleting existing records...'

Channeluser.delete_all
Message.delete_all
Channel.delete_all
User.delete_all

puts 'Seed: Seeding...'

images = [
        "https://images.unsplash.com/photo-1628359355624-855775b5c9c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YXJ0aXN0c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60",
        "https://images.unsplash.com/photo-1618578353017-74b491b3ece9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80",
        "https://images.unsplash.com/photo-1611244419377-b0a760c19719?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80",
        "https://images.unsplash.com/photo-1602331117300-85450ebe5c91?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzV8fGFydGlzdHN8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
        "https://images.unsplash.com/photo-1573844874632-733b0d7dc163?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTJ8fGFydGlzdHN8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
        "https://images.unsplash.com/photo-1643310814277-536eacfa21ed?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8bXVzY2lhbnN8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
        "https://images.unsplash.com/photo-1564109799258-6b7c25cd1c92?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzh8fGFydGlzdHN8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
        "https://images.unsplash.com/photo-1581368076903-c20fee986735?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODl8fGFydGlzdHN8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
        "https://images.unsplash.com/photo-1632478179636-23973447e686?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80",
        "https://images.unsplash.com/photo-1648737119422-2680a7e39089?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=872&q=80",
        "https://images.unsplash.com/photo-1654512541705-4652c8649eb2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80",
        "https://images.unsplash.com/photo-1654823607197-7a45707909cb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
        "https://images.unsplash.com/photo-1589996448606-27d38c70f3bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",
        "https://images.unsplash.com/photo-1611244420030-b22f359eee31?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80",
        "https://images.unsplash.com/photo-1581368121163-0d9c85127cdd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",
        "https://images.unsplash.com/photo-1535146851324-6571dc3f2672?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",
        "https://images.unsplash.com/photo-1520207588543-1e545b20c19e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2071&q=80",
        "https://images.unsplash.com/photo-1597310502125-2eb9d5198a57?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80",
        "https://images.unsplash.com/photo-1588025014019-d0f99ee89043?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=976&q=80",
        "https://images.unsplash.com/photo-1620167314245-53faf10ee530?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"
        ]

images.each do |image|
  email = Faker::Internet.email
  username = Faker::Artist.name
  password = "123456"
  bio = Faker::Quote.matz
  picture_file = URI.open(image)
  ig_tag = "ig_tag"

  new_user = User.new(email: email, username: username, password: password, bio: bio, ig_tag: ig_tag )
  new_user.profile_picture.attach(io: picture_file, filename: 'avatar.png', content_type: 'image/png')
  new_user.save
end

creators = User.order('RANDOM()').first(6)

creators.each do |creator|
  name = Faker::Hipster.word
  description = Faker::Hipster.sentence
  photo_file = URI.open(images.sample)
  user = creator

  new_channel = Channel.new(name: name, description: description, user: user)
  new_channel.photo.attach(io: photo_file, filename: 'channelphoto.png', content_type: 'image/png')
  new_channel.save
end


User.all.each do |user|
  Channeluser.create!(user: user, channel: Channel.order('RANDOM()').first)
end

new_user = User.new(email: "test@test.com", username: "supertester", password: "123456", bio: "I am the mega tester", ig_tag: "megatester" )
tester_picture_file = URI.open("https://images.unsplash.com/photo-1529066792305-5e4efa40fde9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80")
new_user.profile_picture.attach(io: tester_picture_file,
                                filename: 'avatar.png',
                                content_type: 'image/png'
                              )
new_user.save

puts 'Seed: Finished seeding!'
