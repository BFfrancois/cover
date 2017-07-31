# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding data..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

## JOBTYPES

Jobtype.destroy_all

Jobtype.find_or_create_by! name: 'dishwasher'

Jobtype.find_or_create_by! name: 'line cook'

Jobtype.find_or_create_by! name: 'sous chef'

Jobtype.find_or_create_by! name: 'prep chef'

Jobtype.find_or_create_by! name: 'waiter'

Jobtype.find_or_create_by! name: 'hostess'


## USERTYPES

Usertype.destroy_all

puts "Finding or creating Usertypes..."

typeRestaurant = Usertype.find_or_create_by! name: 'restaurant'

typeWorker = Usertype.find_or_create_by! name: 'worker'


## USERS

puts "Finding or creating Users..."

User.destroy_all

userColin = typeRestaurant.users.create!({
                                             email: 'colinpark4@gmail.com',
                                             password_digest: '1234',
                                             cell: '17788884322',
                                             first_name: 'Colin',
                                             last_name: 'Park',
                                             restaurant_name: 'Hawksworth Restaurant',
                                             street_address: '801 West Georgia Street',
                                             city: 'Vancouver',
                                             province: 'BC',
                                             postal_code: 'V6C 1P7',
                                             description: 'Inventive Pacific Northwest cuisine & extensive wine list served in the Rosewood Hotel Georgia.',
                                             image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTL-A8kRLKY_AxISxj6diUGNrwlLO61o4XwoVXi7ponKr83Xhbe7A',
                                         })

userManuel = typeRestaurant.users.create!({
                                              email: 'prezcabellomanuel@gmail.com',
                                              password_digest: '1234',
                                              cell: '16047679548',
                                              first_name: 'Manuel',
                                              last_name: 'Cabello',
                                              restaurant_name: 'Meat & Bread',
                                              street_address: '370 Cambie Street',
                                              city: 'Vancouver',
                                              province: 'BC',
                                              postal_code: 'V6B 1H7',
                                              description: 'We make sandwiches that are high quality, of good value, and prepared with skill as well as heart. The essence of our food simple, fast, delicious is the foundation of Meat & Bread.',
                                              image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdtrR8w6mYA9934vUiFgQZwJjRRxICExwmEkpdR-Qb82Smh5Ex',
                                          })

userMike = typeRestaurant.users.create!({
                                            email: 'zlymike@outlook.com',
                                            password_digest: '1234',
                                            cell: '17788620328',
                                            first_name: 'Michael',
                                            last_name: 'Zhu',
                                            restaurant_name: 'Bestie',
                                            street_address: '105 E Pender Street',
                                            city: 'Vancouver',
                                            province: 'BC',
                                            postal_code: 'V6A 1T5',
                                            description: 'German-inspired eatery serving sausages, currywurst, pretzels, beer & wine in cool environs.',
                                            image: 'https://vanfoodies.files.wordpress.com/2014/02/img_20140207_185734.jpg',
                                        })

typeWorker.users.create!({
                             email: 'bergeretforestier.francois@gmail.com',
                             password_digest: '1234',
                             cell: '17787071254',
                             first_name: 'Francois',
                             last_name: 'Bergeret_Forestier',
                             restaurant_name: '',
                             street_address: '',
                             city: '',
                             province: '',
                             postal_code: 'P6A 1Z2',
                             description: '',
                             image: 'http://lorempixel.com/400/200/people/',
                         })

typeWorker.users.create!({
                             email: 'mark.bickford@icloud.com',
                             password_digest: '1234',
                             cell: '17783895004',
                             first_name: 'Mark',
                             last_name: 'Bickford',
                             restaurant_name: '',
                             street_address: '',
                             city: '',
                             province: '',
                             postal_code: 'T2A 1C8',
                             description: '',
                             image: 'http://lorempixel.com/400/200/people/',
                         })

typeWorker.users.create!({
                             email: 'aru@astana.com',
                             password_digest: '1234',
                             cell: '15044054545',
                             first_name: 'Fabio',
                             last_name: 'Aru',
                             restaurant_name: '',
                             street_address: '',
                             city: '',
                             province: '',
                             postal_code: 'N5W 2S9',
                             description: '',
                             image: 'http://lorempixel.com/400/200/people/',
                         })

typeWorker.users.create!({
                             email: 'christopher@sky.com',
                             password_digest: '1234',
                             cell: '15044054545',
                             first_name: 'Christopher',
                             last_name: 'Froome',
                             restaurant_name: '',
                             street_address: '',
                             city: '',
                             province: '',
                             postal_code: 'V2P 2M1',
                             description: '',
                             image: 'http://lorempixel.com/400/200/people/',
                         })

typeWorker.users.create!({
                             email: 'bardet@ag2r.com',
                             password_digest: '1234',
                             cell: '15044054545',
                             first_name: 'Romain',
                             last_name: 'Bardet',
                             restaurant_name: '',
                             street_address: '',
                             city: '',
                             province: '',
                             postal_code: 'L9H 1E6',
                             description: '',
                             image: 'http://lorempixel.com/400/200/people/',
                         })


## JOBS

puts "Creates Jobs..."

Job.destroy_all

jobColin1 = userColin.jobs.create!({
                                       start_time: '2017-07-22 14:00:00',
                                       end_time: '2017-07-22 20:00:00',
                                       rate: '2000',
                                       description: 'This will be a very busy shift so tips should be good!',
                                       status: 'open',
                                       jobtype_id: '1',
                                   })

jobColin2 = userColin.jobs.create!({
                                       start_time: '2017-06-28 06:00:00',
                                       end_time: '2017-06-28 12:00:00',
                                       rate: '1400',
                                       description: 'Breakfast rush.',
                                       status: 'closed',
                                       jobtype_id: '2',
                                   })

jobManuel1 = userManuel.jobs.create!({
                                         start_time: '2017-07-20 18:00:00',
                                         end_time: '2017-07-20 23:30:00',
                                         rate: '1800',
                                         description: 'We are looking for an experienced busboy. Five years of experience at minimum please!',
                                         status: 'open',
                                         jobtype_id: '3',
                                     })

jobMike1 = userMike.jobs.create!({
                                     start_time: '2017-07-21 10:00:00',
                                     end_time: '2017-07-21 19:00:00',
                                     rate: '2400',
                                     description: 'We really need a line cook ASAP!',
                                     status: 'open',
                                     jobtype_id: '4',
                                 })

## EXPERIENCES

puts "Creates experiences..."

Experience.destroy_all

Experience.find_or_create_by!({
                                  user_id: '1',
                                  jobtype_id: '1',
                                  employer_name: 'Cactus Club',
                                  months: '24',
                                  description: 'Test test test test',
                              })

puts "Done y'all..."