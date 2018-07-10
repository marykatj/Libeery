# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.destroy_all
Beer.destroy_all
User.destroy_all

j = User.create(name:"Jerk")
hd = Beer.create(name: "Hop-Dumbass", brewery:"Governor's Island Brewing Company", style: "IPA", abv: "6.0%")
Post.create(description: "Pretty good", situation:"When you're having a good one", beer: hd, user: j)
