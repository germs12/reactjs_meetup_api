# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Owner.destroy_all
Car.destroy_all
Garage.destroy_all

25.times do
  o = Fabricate :owner
  g = Fabricate :garage
  c = Fabricate(:car, owner_id: o.id, garage_id: g.id)
end
