# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|	
	name  = Faker::Name.name
  password = Faker::Internet.password
  email = Faker::Internet.email
  User.create!(name:  name, password: password, email: email)			
end

fixtures_path = Rails.root.join('app', 'assets', 'images', 'fixtures')


users = User.order(:created_at).take(6)
10.times do 	
	users.each do |user| 
		user.photos.create!(title: "some title", image: File.new(fixtures_path.join('cpu.jpg')))
	end
end

users = User.all

1.upto 10 do |i|
	user = User.find(i)
	follower = users.sample
	unless (user.id == follower.id) && (user.following?(follower)) 
		user.follow(follower)
	end
end





