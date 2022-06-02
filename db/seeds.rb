# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

# create 4x user profiles

Booking.destroy_all && Pet.destroy_all && User.destroy_all

AGE = (18..100).to_a

User.create(username: 'Reiko', email: 'reiko@gmail.com', password: 'testing', age: AGE.sample)
User.create(username: 'Callum', email: 'callum@gmail.com', password: 'testing', age: AGE.sample)
User.create(username: 'Ethan', email: 'ethan@gmail.com', password: 'testing', age: AGE.sample)
User.create(username: 'Xander', email: 'xander@gmail.com', password: 'testing', age: AGE.sample)

# create 16x dog profiles

DOG_NAMES = ["Lola", "Oscar", "Barney", "Fido", "Bella", "Barker", "Daisy", "Figs", "Milo", "Marley", "Luna",
             "Riley", "Coco", "Lucky", "Pluto", "Beethoven", "Lassie", "Clifford", "Scooby", "Winnie", "Hooch",
             "Baxter", "Dug", "Toto", "Sass"]

TOILET_TRAINED = [true, false]


DOG_ADDR = ["richmond, VIC, Australia", "melbourne, VIC, Australia", "springvale, VIC, Australia", "croydon, VIC, Australia", "ringwood, VIC, Australia", "fitzroy, VIC, Australia", "brunswick, VIC, Australia","ivanhoe, VIC, Australia","footscray, VIC, Australia","yarraville, VIC, Australia","sunshine, VIC, Australia","brooklyn, VIC, Australia"]

# Photos

pet_photo = ['https://i.natgeofe.com/n/4f5aaece-3300-41a4-b2a8-ed2708a0a27c/domestic-dog_thumb_square.jpg', 'https://bouncymustard.com/wp-content/uploads/2021/06/1-Funny-Dogs-Wearing-Wigs.jpg', 'https://images.unsplash.com/photo-1518020382113-a7e8fc38eac9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8ZnVubnklMjBkb2d8ZW58MHx8MHx8&w=1000&q=80', 'https://hips.hearstapps.com/wdy.h-cdn.co/assets/17/39/1506709524-cola-0247.jpg?crop=1.00xw:0.750xh;0,0.226xh&resize=480:*', 'https://i.pinimg.com/564x/62/39/65/623965b222fc9a376e93ed412132f229.jpg', 'https://www.coopsandcages.com.au/wp-content/uploads/2021/04/Cute-Dog-Breeds.png']

i = 1
12.times do
  pet = Pet.new(name: DOG_NAMES.sample, species: 'dog', toilet_trained: TOILET_TRAINED.sample, description: "best pet ever, man and womans best friend, sometimes pees on the floor but still very lovable", price_per_day: rand(25..100), user: User.all.sample)
  file = URI.open(pet_photo.sample)
  pet.photos.attach(io: file, filename: "dog#{i}.png", content_type: 'image/png')
  pet.address = DOG_ADDR[i - 1]
  pet.save!
  i += 1
end

p 'random seeds completed'

rabbit = Pet.new(name: DOG_NAMES.sample, species: 'dog', toilet_trained: TOILET_TRAINED.sample, description: "hops a lot, big ball of fluff - great for hugs", price_per_day: rand(25..100), user: User.all.sample)
file = URI.open('https://images.unsplash.com/photo-1585110396000-c9ffd4e4b308?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmFiYml0fGVufDB8fDB8fA%3D%3D&w=1000&q=80')
rabbit.photos.attach(io: file, filename: "rabbittwo.png", content_type: 'image/png')
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQimKYQiAFfFqC-2xlcGaf9WEaEBKxVoCp-4Q&usqp=CAU')
rabbit.photos.attach(io: file, filename: "rabbitone.png", content_type: 'image/png')
file = URI.open('https://kowloon-vet-hospital.com/wp-content/uploads/2017/11/Rabbit.jpg')
rabbit.photos.attach(io: file, filename: "rabbitthree.png", content_type: 'image/png')
rabbit.address = DOG_ADDR[5]
rabbit.save!

p 'rabbit seeded'

wallaby = Pet.new(name: DOG_NAMES.sample, species: 'wallaby', toilet_trained: TOILET_TRAINED.sample, description: "bit wild but much nicer than a kangaroo", price_per_day: rand(25..100), user: User.all.sample)
file = URI.open('https://animals.sandiegozoo.org/sites/default/files/inline-images/western-grey-kangaroo.jpg')
wallaby.photos.attach(io: file, filename: "wallabyone.png", content_type: 'image/png')
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/7/74/Red_necked_wallaby444.jpg')
wallaby.photos.attach(io: file, filename: "wallabytwo.png", content_type: 'image/png')
file = URI.open('https://w2.chabad.org/media/images/1122/FuEe11225216.jpg?_i=_n504BC99DD0473598AAE3BCDC5D75568D')
wallaby.photos.attach(io: file, filename: "wallabythree.png", content_type: 'image/png')
wallaby.address = DOG_ADDR[3]
wallaby.save!

p 'wallaby seeded'

dog = Pet.new(name: DOG_NAMES.sample, species: 'dog', toilet_trained: TOILET_TRAINED.sample, description: "best pet ever, man and woman's best friend. Sometimes pees on the floor but still very lovable", price_per_day: rand(25..100), user: User.all.sample)
file = URI.open('https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg')
dog.photos.attach(io: file, filename: "dogone.png", content_type: 'image/png')
file = URI.open('https://www.purina.com.au/-/media/project/purina/main/breeds/puppies/puppy-golden-retriever.jpg')
dog.photos.attach(io: file, filename: "dogtwo.png", content_type: 'image/png')
file = URI.open('https://i.pinimg.com/originals/32/e2/b8/32e2b8e0d273c84dce7ded590d56bbfe.jpg')
dog.photos.attach(io: file, filename: "dogthree.png", content_type: 'image/png')
dog.address = DOG_ADDR[10]
dog.save!

p 'dog example seeded'
p 'seed complete'
