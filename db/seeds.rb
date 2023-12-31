# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Destroying previous articles...'
BlogArticle.destroy_all

puts 'Creating faker articles...'

10.times do
  article = BlogArticle.create(title: Faker::Book.unique.title, content: Faker::Quote.unique.matz)
  puts "Article #{article.id} has been created."
end

puts "You have created #{BlogArticle.count} articles successfully."
