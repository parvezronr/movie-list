# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
  puts "Seeding././././././././././././././."

  genre = Genre.create( name: 'Fantacy')
  genre = Genre.create( name: 'Drama')
  genre = Genre.create( name: 'Sci-Fi')
  genre = Genre.create( name: 'Comedy')
  genre = Genre.create( name: 'Documentary')
  movies = Movie.create([{ name: 'Star Wars', year: 2018, genre_id: Genre.first.id }, { name: 'Lord of the Rings', year: 2001, genre_id: Genre.first.id}])
  movies = Movie.create([{ name: 'Star Wars', year: 2018, genre_id: Genre.first(2).last.id}, { name: 'Lord of the Rings', year: 2001, genre_id: Genre.first(2).last.id}])
  movies = Movie.create([{ name: 'Star Wars', year: 2018, genre_id: Genre.first(3).last.id}, { name: 'Lord of the Rings', year: 2001, genre_id: Genre.first(3).last.id}])
  movies = Movie.create([{ name: 'Star Wars', year: 2018, genre_id: Genre.first(4).last.id}, { name: 'Lord of the Rings', year: 2001, genre_id: Genre.first(4).last.id}])
