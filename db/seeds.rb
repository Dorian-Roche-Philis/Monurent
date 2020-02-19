# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require 'open-uri'
require 'nokogiri'

User.destroy_all
Monument.destroy_all
# scrapping initialize
url = "https://designlike.com/100-most-famous-landmarks-around-the-world/"
array = []
puts 'fetching website'
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('strong').each do |title|
    arr = title.text.strip.split('. ')
    if arr[1] != nil
      array << arr[1]
    end
end

monuments = []
array.each do |x|
  if x[1] != nil
    monuments << x.split(" in ")
  end
end

#create photo
image =[]
html_doc.search('.aligncenter').each do |title|
  image <<  title.attribute('src').value
end
image.delete_at(3)
image.delete_at(4)
image.delete_at(5)
image.delete_at(7)
image.delete_at(8)
image.delete_at(11)
image.delete_at(18)
image.delete_at(16)


anne = User.create!(first_name: "Anne", last_name: "Hidalgo", email: "anne@paris.com", phone_number: "06 75 00 07 50", address: "Notre de dame 75000 Paris", password: "123456", password_confirmation: "123456")
ben = User.create!(first_name: "Benjamin", last_name: "Netanyahu", email: "benjamin@tel-aviv.com", phone_number: "9726 61 00 061 99", address: "Tayelet, Hayarkon, Tel Aviv", password: "123457", password_confirmation: "123457")
donald = User.create!(first_name: "Donald", last_name: "Trump", email: "donald@washington.com", phone_number: "01 23 45 67 89", address: "Trump Tower, 725 5th Ave, New York, NY 10022", password: "123458", password_confirmation: "123458")
vlad = User.create!(first_name: "Vladimir", last_name: "Putin", email: "vladimir@moscow.com", phone_number: "0007 007 007", address: "The Moscow Kremlin, Moscow, Russia, 103073", password: "123459", password_confirmation: "123459")
grigri = User.create!(first_name: "Benjamin", last_name: "Griveaux", email: "grigri@film-maker.com", phone_number: "06 96 96 75 00", address: "Grand Pigalle Hotêl, 29 Rue Victor Massé 75009 Paris", password: "123450", password_confirmation: "123450")
price = (50...500).to_a
tab = [anne, ben, donald, vlad, grigri]
description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
count = 0

monuments.each do |monument|
   mon = Monument.new(name: monument[0], city: monument[1], price: price.sample, description: description, address: "#{monument[0]}, #{monument[1]}")
   if image[count] != nil
    mon.photo.attach(io: URI.open(image[count]), filename: "photo#{count}.png", content_type: 'image/png')
   end
   count += 1

   if mon.city?
     mon.user = tab.sample
     mon.save!
  end
end


   #array << title.text.strip.split(', ')


  #puts element.text.strip
  #puts element.attribute('href').value
  #p array

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
