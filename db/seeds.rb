# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
  new_show = Show.new.tap do |show|
    show.title = Faker::Beer.name
    show.description = Faker::Beer.name
    show.location = Faker::Beer.name
    show.city = Faker::Beer.name
    show.postalcode = Faker::Beer.name
    show.street = Faker::Beer.name
    show.source = Faker::Beer.name
    show.planned_for = Faker::Date.forward(days: 365)
  end

  new_show.save
  new_show.flyer.attach({
    io: open(Faker::Avatar.image),
    filename: "faker_image.jpg"
  })
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?