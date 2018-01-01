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


#get https://uinames.com/ api user profile info
uri = URI("https://uinames.com/api/?ext")
#get 15.times for api
15.times do
  User.destroy_all
  response = Net::HTTP.get_response(uri)
  api_info = JSON.parse(response.body)
  User.create(email: api_info["email"], password: api_info["password"], name: api_info["name"], gender: api_info["gender"], age: api_info["age"], phone: api_info["phone"], photo: api_info["photo"] )

end
puts "cureated user info from api "

#json 格式
#{"name"=>"Patricia", "surname"=>"Quintero", "gender"=>"female", "region"=>"Mexico", "age"=>26, "title"=>"ms", "phone"=>"(683) 252 4017", "birthday"=>{"dmy"=>"11/02/1991", "mdy"=>"02/11/1991", "raw"=>666322033}, "email"=>"patricia_91@example.com", "password"=>"Quintero91*%", "credit_card"=>{"expiration"=>"3/19", "number"=>"3697-4239-2793-9139", "pin"=>4067, "security"=>393}, "photo"=>"https://uinames.com/api/photos/female/6.jpg"}
