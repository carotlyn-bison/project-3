# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Book.destroy_all

Book.create([
  {title: 'The Great Gatsby',
  author: 'Francis Scott Fitzgerald',
  buy_link: 'https://play.google.com/store/books/details?id=iXn5U2IzVH0C&rdid=book-iXn5U2IzVH0C&rdot=1&source=gbs_vpt_read&pcampaignid=books_booksearch_viewport',
  description: 'The exemplary novel of the Jazz Age, F. Scott Fitzgeralds third book, The Great Gatsby (1925), stands as the supreme achievement of his career. T. S. Eliot read it three times and saw it as the "first step" American fiction had taken since Henry James; H. L. Mencken praised "the charm and beauty of the writing," as well as Fitzgeralds sharp social sense; and Thomas Wolfe hailed it as Fitzgeralds "best work" thus far. The story of the fabulously wealthy Jay Gatsby and his love for the beautiful Daisy Buchanan, of lavish parties on Long Island at a time when, The New York Times remarked, "gin was the national drink and sex the national obsession," it is an exquisitely crafted tale of America in the 1920s that resonates with the power of myth. A novel of lyrical beauty yet brutal realism, of magic, romance, and mysticism, The Great Gatsby is one of the great classics of twentieth-century literature.',
  image:'http://books.google.com/books/content?id=3Z8zxKDqKDMC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api'},
  ])
puts ("#{Book.count}")



