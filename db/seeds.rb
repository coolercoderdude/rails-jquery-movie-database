# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genres = ["Action", "Comedy", "Drama", "Documentary", "Horror", "Indie", "Sci-Fi", "Suspense", "Thriller"]

Genres.each do |genre_name|
  Genre.create(title: genre_name)
end

10.times do
  @user = User.create(email: Faker::Internet.email, password: Faker::Internet.password)
  @user.movies.create(title: Faker::Book.title, release_date: rand(1920..2018), critic_rating: rand(0..100), awards: rand(0..20), genre_id: Genre.all.ids.sample, created_by: self.email)
end

gender_choice = ["Male", "Female"]

Movie.all.each do |movie|
  character = movie.characters.build(name: Faker::Name.first_name, movie_id: self.id, quote: Faker::Movie.quote)
  character_2 = movie.characters.build(name: Faker::Name.first_name, movie_id: self.id, quote: Faker::Movie.quote)
  character_3 = movie.characters.build(name: Faker::Name.first_name, movie_id: self.id, quote: Faker::Movie.quote)
  character.actor.build(name: Faker::Name.name, gender: gender_choice.sample, age: rand(1..100))
  character_2.build(name: Faker::Name.name, gender: gender_choice.sample, age: rand(1..100))
  character_3.build(name: Faker::Name.name, gender: gender_choice.sample, age: rand(1..100))

10.times do
  Actor.create(name: Faker::Name.name, gender: gender_choice.sample, age: rand(1..100))
end

3.times do
  @character = Character.create(name: Faker::Name.first_name, actor_id: Actor.all.sample.id, movie_id: @movie.id )
  @character_2 = Character.create(name: Faker::Name.first_name, actor_id: Actor.all.sample.id, movie_id: @movie_2.id)
  @character.save
  @character_2.save
end
