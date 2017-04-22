# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    LocationRating.delete_all
    locations = [{lat:32.756033,long:-117.199059}, {lat:41.052942,long:-73.543161}, {lat:37.7918105,long:-122.4058103}, {lat:34.0110435,long:-118.4915798}, {lat:32.711534,long:-117.159377}, {lat:33.127639,long:-117.1653983}]
    locations.each do |location|
      location_rating = LocationRating.find_or_initialize_by(lat:location[:lat],long:location[:long])
      location_rating.rating = nil
      location_rating.email = nil
      location_rating.save
    end