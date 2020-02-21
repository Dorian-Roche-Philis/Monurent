# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require 'open-uri'
require 'nokogiri'

Booking.destroy_all
Review.destroy_all
Monument.destroy_all
User.destroy_all
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

# create 5 users
anne = User.new(first_name: "Anne", last_name: "Hidalgo", email: "anne@paris.com", phone_number: "06 75 00 07 50", address: "Notre de dame 75000 Paris", password: "123456", password_confirmation: "123456")
anne.photo.attach(io: URI.open("https://resize-elle.ladmedia.fr/r/625,,forcex/crop/625,804,center-middle,forcex,ffffff/img/var/plain_site/storage/images/people/la-vie-des-people/une-journee-avec/une-journee-avec-anne-hidalgo-2409326/35186746-1-fre-FR/Une-journee-avec-Anne-Hidalgo.jpg"), filename: "hidalgo.png", content_type: 'image/png')
anne.save!
ben = User.new(first_name: "Benjamin", last_name: "Netanyahu", email: "benjamin@tel-aviv.com", phone_number: "9726 61 00 061 99", address: "Tayelet, Hayarkon, Tel Aviv", password: "123456", password_confirmation: "123456")
ben.photo.attach(io: URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Benjamin_Netanyahu_2018.jpg/220px-Benjamin_Netanyahu_2018.jpg"), filename: "netanyahu.png", content_type: 'image/png')
ben.save!
donald = User.new(first_name: "Donald", last_name: "Trump", email: "donald@washington.com", phone_number: "01 23 45 67 89", address: "Trump Tower, 725 5th Ave, New York, NY 10022", password: "123456", password_confirmation: "123456")
donald.photo.attach(io: URI.open("https://image.cnbcfm.com/api/v1/image/104681319-GettyImages-837567644.jpg?v=1582143987&w=678&h=381"), filename: "trump.png", content_type: 'image/png')
donald.save!
vlad = User.new(first_name: "Vladimir", last_name: "Putin", email: "vladimir@moscow.com", phone_number: "0007 007 007", address: "The Moscow Kremlin, Moscow, Russia, 103073", password: "123456", password_confirmation: "123456")
vlad.photo.attach(io: URI.open("https://d.newsweek.com/en/full/619131/vladimir-putin-russian-president.jpg"), filename: "putin.png", content_type: 'image/png')
vlad.save!
grigri = User.new(first_name: "Benjamin", last_name: "Griveaux", email: "grigri@film-maker.com", phone_number: "06 96 96 75 00", address: "Grand Pigalle Hotêl, 29 Rue Victor Massé 75009 Paris", password: "123456", password_confirmation: "123456")
grigri.photo.attach(io: URI.open("https://img-4.linternaute.com/WrLHCs1EOuUr2j2-knhFYQ6D1MU=/1240x/smart/8bf7737a8bfc4e5bbee8742751badfe7/ccmcms-linternaute/13757844.jpg"), filename: "griveaux.png", content_type: 'image/png')
grigri.save!
price = (50...500).to_a
tab = [anne, ben, donald, vlad, grigri]
count = 0

monuments.each do |monument|
   priz = price.sample
   description = "#{monument[0]} is the world's largest historic monument of #{monument[1]}. you can MONURENT this awesome place for the ridiculous price of #{priz} Millions of €. The creator of the sublime #{monument[0]} thanks you."
   mon = Monument.new(name: monument[0], city: monument[1], price: priz, description: description, address: "#{monument[0]}, #{monument[1]}")
   if image[count] != nil

    mon.photos.attach(io: URI.open(image[count]), filename: "photo#{count}.png", content_type: 'image/png')
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
