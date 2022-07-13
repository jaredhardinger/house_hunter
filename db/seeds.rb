# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
agent = Agent.create!( name:             "Steve Chicken",
                       licensed_realtor: true,
                       review_rating:    4.8)
house_1 = agent.houses.create!( address:     "292 5th Ave",
                         price:       195000,
                         for_sale:    true)
house_2 = agent.houses.create!( address:     "14 Cherry St",
                         price:       265000,
                         for_sale:    true)
