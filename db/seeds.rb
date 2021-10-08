puts "Clearing old data..."
Driver.destroy_all
Rider.destroy_all
Trip.destroy_all

puts "Seeding drivers..."
Driver.create(name: "Bob", rating: rand(1..5))
Driver.create(name: "James", rating: rand(1..5))
Driver.create(name: "Mary", rating: rand(1..5))
Driver.create(name: "Robert", rating: rand(1..5))
Driver.create(name: "Patricia", rating: rand(1..5))
Driver.create(name: "John", rating: rand(1..5))
Driver.create(name: "Jennifer", rating: rand(1..5))
Driver.create(name: "Michael", rating: rand(1..5))
Driver.create(name: "Linda", rating: rand(1..5))
Driver.create(name: "William", rating: rand(1..5))

puts "Seeding riders..."
Rider.create(name: "Elizabeth", rating: rand(1..5))
Rider.create(name: "David", rating: rand(1..5))
Rider.create(name: "Barbara", rating: rand(1..5))
Rider.create(name: "Richard", rating: rand(1..5))
Rider.create(name: "Susan", rating: rand(1..5))
Rider.create(name: "Joseph", rating: rand(1..5))
Rider.create(name: "Jessica", rating: rand(1..5))
Rider.create(name: "Thomas", rating: rand(1..5))
Rider.create(name: "Sarah", rating: rand(1..5))
Rider.create(name: "Christopher", rating: rand(1..5))

puts "Seeding trips..."
15.times do
    Trip.create(distance: rand(1..100), price: rand(1..100), rider_id: Rider.ids.sample, driver_id: Driver.ids.sample)
end

puts "Done seeding!"