# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PostCategory.destroy_all
Category.destroy_all
Post.destroy_all
Beer.destroy_all
User.destroy_all

Category.create(name: "Hoppy")
Category.create(name: "Dry")
Category.create(name: "Malty")
Category.create(name: "Crisp")
Category.create(name: "Sweet")
Category.create(name: "Hazy")
Category.create(name: "Citrus")
Category.create(name: "Piney")
Category.create(name: "Earthy")
Category.create(name: "Bready")
Category.create(name: "Toasty")
Category.create(name: "Golden")
Category.create(name: "Sour")
Category.create(name: "Rich")
Category.create(name: "Grainy")
Category.create(name: "Smokey")
Category.create(name: "Fruity")
Category.create(name: "Spicy")
Category.create(name: "Bright")
Category.create(name: "Herbal")
Category.create(name: "Aromatic")
Category.create(name: "Floral")
Category.create(name: "Belgian")
Category.create(name: "Tropical")
Category.create(name: "Creamy")
Category.create(name: "Light")
Category.create(name: "Heavy")
Category.create(name: "Thick")
Category.create(name: "Thin")
Category.create(name: "Clean")
Category.create(name: "Bitter")


j = User.new(name:"Jerk", location: "Jerk-Town", password: '12345')
j.password_confirmation
j.save

hd = Beer.create(name: "Hop-Dumbass", brewery:"Governor's Island Brewing Company", style: "IPA", abv: "6.0%")
vna = Beer.create(name: "Very Normal Ale", brewery:"Anonymous Brew", style: "Pilsner", abv: "5.0%")

Post.create(description: "Pretty good", situation:"When you're having a good one", beer: hd, user: j).categories << Category.find_by(name: 'Hoppy') << Category.find_by(name: 'Dry') << Category.find_by(name: 'Piney')
Post.create(description: "The worst.", situation:"Never, stay away", beer: vna, user: j).categories << Category.find_by(name: 'Thin')
