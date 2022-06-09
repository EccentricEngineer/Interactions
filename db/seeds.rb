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
Channel.delete_all
Message.delete_all
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
        "https://images.unsplash.com/photo-1632478179636-23973447e686?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80"
        ]

10.times do
  email = Faker::Internet.email
  username = Faker::Artist.name
  password = "123456"
  bio = Faker::Quote.matz
  picture_file = URI.open(images.sample)
  ig_tag = "ig_tag"

  new_user = User.new(email: email, username: username, password: password, bio: bio, ig_tag: ig_tag )
  new_user.profile_picture.attach(io: picture_file, filename: 'avatar.png', content_type: 'image/png')
  new_user.save

end

creators = User.order('RANDOM()').first(5)

5.times do
  name = Faker::Hipster.word
  description = Faker::Hipster.sentence
  photo_file = URI.open(images.sample)
  user = creators.sample

  new_channel = Channel.new(name: name, description: description, user: user)
  new_channel.photo.attach(io: photo_file, filename: 'channelphoto.png', content_type: 'image/png')
  new_channel.save
end


User.all.each do |user|
  Channeluser.create!(user: user, channel: Channel.order('RANDOM()').first)
end

puts 'Seed: Finished seeding!'

# Seeding links

# Avatars

# https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXZhdGFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60

# https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YXZhdGFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60

# https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YXZhdGFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60

# https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8YXZhdGFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60

# https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGF2YXRhcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60

# https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGF2YXRhcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60

# https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGF2YXRhcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60

# https://images.unsplash.com/photo-1566492031773-4f4e44671857?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80

# https://images.unsplash.com/photo-1568822617270-2c1579f8dfe2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80

# https://images.unsplash.com/photo-1586297135537-94bc9ba060aa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80

# https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1064&q=80

# https://images.unsplash.com/photo-1630841539293-bd20634c5d72?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1064&q=80

# Artists
