# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.delete_all

Cat.create!(birth_date: Date.new, color: "white", name: "albert", sex: "M", description: "albertiest kitty")
Cat.create!(birth_date: Date.new, color: "black", name: "cutiepie", sex: "M", description: "this ones ugly")
Cat.create!(birth_date: Date.new, color: "black", name: "kitty", sex: "M", description: "cutiest")
Cat.create!(birth_date: Date.new, color: "white", name: "lovely", sex: "F", description: "meh")
Cat.create!(birth_date: Date.new, color: "white", name: "star", sex: "F", description: "stray")
Cat.create!(birth_date: Date.new, color: "orange", name: "ocean", sex: "F", description: "lovelyosetruoersthu")
Cat.create!(birth_date: Date.new, color: "black", name: "freddie", sex: "M", description: "really fat")
Cat.create!(birth_date: Date.new, color: "orange", name: "muriel", sex: "F", description: "tea pot kitten")
Cat.create!(birth_date: Date.new, color: "orange", name: "bob", sex: "F", description: "bob is my cat")
