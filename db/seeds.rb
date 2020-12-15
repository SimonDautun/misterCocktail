# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "json"
require 'rest-client'

puts 'Cleaning database...'
Ingredient.delete_all

puts 'Creating ingredient'
rm = RestClient.get 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

rm_array = JSON.parse(rm)['drinks']

puts rm_array

rm_array.each do |ingredient|
  ingredient = Ingredient.create!(
    name: ingredient['strIngredient1']
  )
  puts "Created #{ingredient.name}"
end

puts 'Finished!'
