# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Book.destroy_all

Book.create([
  {
    title: "Infinite Jest",
    author: "David Foster Wallace",
    buy_link: "https://play.google.com/store/books/details?id=Nhe2yvx6hP8C&rdid=book-Nhe2yvx6hP8C&rdot=1&source=gbs_api",
    description: "Best Book Ever",
    user_id: 1,
    image: "test"
  },
  {
    title: "Ready Player One",
    author: "Ernest Cline",
    buy_link: "some bullshit",
    description: "some bullshit",
    user_id: 1,
    image: "some bullshit"
  }
  ])


  puts "created #{Book.count} books"
