# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all

u1 = User.create :name => "Priyanka", :email_id => "priyanks@ga.co" ,:password => "chicken", :password_confirmation => "chicken"
u2 = User.create :name => "Alicia " , :email_id => "alicia@ga.co", :password => "chicken", :password_confirmation => "chicken"
u3 = User.create :name => "Kresty", :email_id => "kresty@ga.co" ,:password => "chicken", :password_confirmation => "chicken"
p "User count: #{User.all.count}"
p u1

Recipe.destroy_all
r1 = Recipe.create :name => "Omlete", :instructions => "Add your eggs and move the pan around to spread them out evenly.
 Continue as for the basic omelette. Quarter or roughly chop the mushrooms and add to a hot frying pan with a small knob of butter,
 # a drizzle of olive oil and a pinch of salt and pepper. Fry and toss around until golden, then turn the heat down to medium.", :image => "https://i.ytimg.com/vi/V0ZdqdXjmWw/maxresdefault.jpg"

 r2 = Recipe.create :name => "Pancake", :instructions => "Whisk milk, eggs and vanilla together in a jug. Sift flour into a large bowl. Stir in sugar. Make a well in the centre.
 Add milk mixture. Whisk until just combined.Heat a large non-stick frying pan over medium heat. Spray with cooking oil. Using 1/4 cup mixture per pancake,
 cook 2 pancakes for 2 minutes or until bubbles appear on surface. Turn and cook for a further 1-2 minutes or until cooked through. Transfer to a plate. Cover loosely with foil to keep warm.
  Repeat with remaining mixture, spraying pan with cooking oil between batches.", :image => "http://cdn-aws-01.mummypages.ie/images/1223/61/3/7_5/american-pancakes.jpg"

  u1.recipes << r1
  u2.recipes << r2
  u3.recipes << r2

Comment.destroy_all
m1 = Comment.create :name => "Awsome recipe"
m2 = Comment.create :name => "Boring. Required too much time"
m3 = Comment.create :name => "nice taste"
r1.comments << m1
r2.comments << m2 << m3


puts "INGREDIENT ONE RECIPE NAMES"
r1.comments.each do |comment|
  puts "\t#{comment.name}"
end
puts "INGREDIENT ONE RECIPE NAMES"
r2.comments.each do |comment|
  puts "\t#{comment.name}"
end
  p "User one recipe count: #{u1.recipes.count}"
  p "User two recipe count: #{u2.recipes.count}"
  p "User three recipe count: #{u3.recipes.count}"

  p "Recipe one, user name: #{r1.user.name}"
  p "Recipe two, user name: #{r2.user.name}"


  Category.destroy_all
c1 = Category.create :name => "Breakfast"
c2 = Category.create :name => "Lunch"
c3 = Category.create :name => "Dinner"
p "Category count: #{Category.all.count}"


r1.categories << c1 << c2 << c3
r2.categories << c2 << c3
r2.categories << c1 << c3

puts "RECIPE HAS_AND_BELONGS_TO_MANY CATEGORY"
p "Recipe one category count: #{r1.categories.count}"
p "Recipe one category count: #{r2.categories.count}"

Ingredient.destroy_all
i1 = Ingredient.create :name => "Apple"
i2 = Ingredient.create :name => "egg"
i3 = Ingredient.create :name => "Wheat flour"
i3 = Ingredient.create :name => "Blueberry"
i3 = Ingredient.create :name => "Mango"
i3 = Ingredient.create :name => "salt"
i3 = Ingredient.create :name => "Olive oil"
i3 = Ingredient.create :name => "strawberry"
i3 = Ingredient.create :name => "plain flour"
i3 = Ingredient.create :name => "sugar"
i3 = Ingredient.create :name => "cream"
i3 = Ingredient.create :name => "Black paper"

p "Ingredient count: #{Ingredient.all.count}"

i1.recipes << r1 << r2
i2.recipes << r1 << r2
i3.recipes << r1

puts "INGREDIENT HAS_AND_BELONGS_TO_MANY RECIPES"
p "Ingredient one recipe count: #{i1.recipes.count}"
p "Ingredient two recipe count: #{i2.recipes.count}"
p "Ingredient three recipe count: #{i3.recipes.count}"

# puts "SONG HAS_AND_BELONGS_TO_MANY MIXTAPES"
# p "Song one mixtape count: #{s1.mixtapes.count}"
# p "Song two mixtape count: #{s2.mixtapes.count}"
# p "Song three mixtape count: #{s3.mixtapes.count}"

puts "INGREDIENT ONE RECIPE NAMES"
i1.recipes.each do |recipe|
  puts "\t#{recipe.name}"
end

puts "USER HAS_MANY CATEGORIES, THROUGH RECIPES"
p "User one category count: #{u1.categories.count}"
p "User two category count: #{u2.categories.count}"
p "User three category count: #{u3.categories.count}"

puts "CATEGORY HAS_MANY USERS, THROUGH RECIPES"
p "Category one user count: #{c1.users.count}"
p "Category two user count: #{c2.users.count}"
p "Category three user count: #{c3.users.count}"

puts "ALL ARTIST NAMES FOR GENRE ONE"
# Print out all artist names for genre one
c1.users.each do |u|
  puts "\t#{u.name}"
end

puts "ALL CATEGORY NAMES FOR USER ONE"
# Print out all artist names for genre one
u1.categories.each do |c|
  puts "\t#{c.name}"
end
