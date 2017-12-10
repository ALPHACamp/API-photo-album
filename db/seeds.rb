# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Photo.destroy_all

Photo.create(title: "Myra’s Birthday", date: "2013-02-02", description: "This is my favourite photo of Myra's birthday. It was a wonderful day.", file_location: "my-photo/myras-birthday-20130202.jpg")

Photo.create(title: "Family outing", date: "2014-11-13", description: "Spending some time at the park after a long week.", file_location: "my-photo/family-outing-20141113.jpg")

Photo.create(title: "Anniversary", date: "2010-11-22", description: "This is our 2nd anniversary.", file_location: "my-photo/my-anniversary-20101122.jpg")


puts "created seed data"
