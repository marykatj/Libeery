# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Favorite.destroy_all
# PostCategory.destroy_all
# Category.destroy_all
# Post.destroy_all
# Beer.destroy_all
# User.destroy_all
#
# Category.create(name: "Hoppy")
# Category.create(name: "Dry")
# Category.create(name: "Malty")
# Category.create(name: "Crisp")
# Category.create(name: "Sweet")
# Category.create(name: "Hazy")
# Category.create(name: "Citrus")
# Category.create(name: "Piney")
# Category.create(name: "Earthy")
# Category.create(name: "Bready")
# Category.create(name: "Toasty")
# Category.create(name: "Golden")
# Category.create(name: "Sour")
# Category.create(name: "Rich")
# Category.create(name: "Grainy")
# Category.create(name: "Smokey")
# Category.create(name: "Fruity")
# Category.create(name: "Spicy")
# Category.create(name: "Bright")
# Category.create(name: "Herbal")
# Category.create(name: "Aromatic")
# Category.create(name: "Floral")
# Category.create(name: "Belgian")
# Category.create(name: "Tropical")
# Category.create(name: "Creamy")
# Category.create(name: "Light")
# Category.create(name: "Heavy")
# Category.create(name: "Thick")
# Category.create(name: "Thin")
# Category.create(name: "Clean")
# Category.create(name: "Bitter")
# Category.create(name: "Dank")
#
#
# j = User.new(name:"Jerk", location: "Jerk-Town", password: '12345')
# j.password_confirmation
# j.save
#
# hd = Beer.create(name: "Hop-Dumbass", brewery:"Governor's Island Brewing Company", style: "IPA", abv: "6.0%")
# vna = Beer.create(name: "Very Normal Ale", brewery:"Anonymous Brew", style: "Pilsner", abv: "5.0%")
#
# Post.create(description: "Pretty good", situation:"When you're having a good one", beer: hd, user: j).categories << Category.find_by(name: 'Hoppy') << Category.find_by(name: 'Dry') << Category.find_by(name: 'Piney')
# Post.create(description: "The worst.", situation:"Never, stay away", beer: vna, user: j).categories << Category.find_by(name: 'Thin')

###############################################################

# require 'csv'
#
# beer_data = CSV.read('db/beers.csv')
# brewery_data = CSV.read('db/breweries.csv')
# style_data = CSV.read('db/styles.csv')
#
# beers = []
# beer_data.each_with_index do |row, i|
#   unless i == 0
#     beers << [row[2], row[1], row[4], row[5]]
#   end
# end
#
# beers.map! do |beer|
#   brewery = brewery_data.find {|b| b[0] == beer[1]}
#   if brewery.nil?
#     brewery_name = ''
#   else
#     brewery_name = brewery[1]
#   end
#   style = style_data.find {|s| s[0] == beer[2]}
#   if style.nil?
#     style_name = ''
#   else
#     style_name = style[2]
#   end
#   beer[1] = brewery_name
#   beer[2] = style_name
#   beer
# end
#
# beers.each do |beer|
#   Beer.create(name: beer[0], brewery: beer[1], style: beer[2], abv: beer[3])
# end

###############################################################

# require 'faker'
#
# 100.times do
#   User.create(name: Faker::Name.unique.name, location: "#{Faker::Address.city}, #{Faker::Address.country}", password: 'abc')
# end

################################################################

# beer_ids = Beer.all.map {|b| b.id}
# user_ids = User.all.map {|u| u.id}
#
# 10000.times do
#   Favorite.create(user_id: user_ids.sample, beer_id: beer_ids.sample)
# end

################################################################

beer_ids = Beer.all.map {|b| b.id}
user_ids = User.all.map {|u| u.id}

categories = Category.all

descriptions = [
  "This beer was dope!",
  "My dad HATED this shit",
  "Better than Bud Lite",
  "Everyone should try this",
  "Watching the Red Sox and kicking back with this beer",
  "My cat died, but at least I have this beer",
  "Pretty decent",
  "IT'LL GIT U DRUNK!!!",
  "A palate of 3M tape and tree bark, canned pumpkin, veal jerky and hickory-smoked horse buttholes. Malty, like the lips of my lover on a wet Autumn morn', parched highway asphalt, a furtive clown, exactly eleven Calico kittens in a burlap bag and the emergency break from a 1973 Cadillac Coupe deVille.",
  "One of my favorites",
]

situations = ['BBQ', 'At the Beach', "Snow Day", "The Game is on", "Beer Session", "With a Meal", "Breakfast Beer", "Day Drinking", "Lunch Time", "Share with Friends", "Beer Hall", "Brewery Tasting Room", "Going Out", "Movie Night"]

3000.times do
  post = Post.create(user_id: user_ids.sample, beer_id: beer_ids.sample, description: descriptions.sample, situation: situations.sample)
  rand(1..3).times do
    post.categories << categories.sample
  end
end
