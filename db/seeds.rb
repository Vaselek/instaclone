# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


fixtures_path = Rails.root.join('app', 'assets', 'images', 'fixtures')


11.upto 20 do |n|	
	name  = Faker::Name.name
  password = Faker::Internet.password
  email = Faker::Internet.email
  User.create!(name:  name, password: password, email: email, avatar: File.new(fixtures_path.join(n.to_s)))			
end

User.create!(name: 'Asel', password: 'qwerty', email: 'asel@mail.ru')


users = User.all
1.upto 10 do |i|
	users.each do |user| 
		user.photos.create!(title: "some title", image: File.new(fixtures_path.join(i.to_s)))
	end
end

users = User.all

1.upto 11 do |i|
	user = User.find(i)
	follower = users.sample
	unless (user.id == follower.id) && (user.following?(follower)) 
		user.follow(follower)
	end
end


1.upto 11 do |i|
	Comment.create!(
		body: Faker::Name.name,
		user_id: i,
		photo_id: i+1)	
end

1.upto 11 do |i|
	Comment.create!(
		body: Faker::Name.name,
		user_id: i,
		photo_id: i+10)
end
