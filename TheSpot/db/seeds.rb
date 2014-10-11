# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(username:"sarah",password:"password",password_confirmation:"password",email:"sarah@gmail.com")
spot = user.spots.create(name:"Sarah's Bakery",
				  address:"100 Fifth Avenue New York, NY 10003",
				   phone:"212-555-555", price: 2)
Favorite.create(user: user, spot: spot)
Comment.create(user: user, spot: spot, body:"Best cookies ever!")