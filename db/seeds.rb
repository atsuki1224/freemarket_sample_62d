# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 30.times do
#   Product.create(
#      item_name: Faker::Book.unique.title,  
#      description: Faker::Number.between(from: 1, to: 3),
#      item_condition:Faker::Number.between(from: 1, to: 3),
#      trade_status: Faker::Number.between(from: 1, to: 3),
#      size: Faker::Number.between(from: 1, to: 3),
#      bland_id:Faker::Number.between(from: 1, to: 10),
#      category_id:Faker::Number.between(from: 1, to: 100),
#      delivery_charge: Faker::Number.between(from: 1, to: 3),
#      delivery_methot: Faker::Number.between(from: 1, to: 3),
#      delivery_area: Faker::Number.between(from: 1, to: 3),
#      delivery_time: Faker::Number.between(from: 1, to: 3),
#      price: Faker::Number.between(from: 100, to: 100000),
#      user_id: Faker::Number.between(from: 1, to: 3),
#    )
# end

10.times do
  Image.create(
     image: Faker::Avatar.unique.image,
     product_id: 1
   )
end