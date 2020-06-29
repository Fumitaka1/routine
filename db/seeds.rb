# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# cording: UTF-8
User.create!(name: 'admin', email: 'admin@rotine.com', password: 'admins-password', admin: true)
50.times do |no|
  User.create!(name: "test_user_no.#{no + 1}",
               email: "testno#{no + 1}@example.com",
               password: 'a' * 8)
end

50.times do |no|
  Post.create!(title: "test data no.#{no + 1}", content: 'it`s test data haha!', user_id: no + 1)
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
