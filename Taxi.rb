# Step 3
# We now have the beginnings of a Taxi Service! Try it out by creating a new instance of your service, then a handfull of taxi instances. Try running your taxi service with some taxis and people!


class Taxi
  attr_accessor :driver, :seats, :make, :model, :license_plate, :rider_list
  def initialize(driver = "Morgan Freeman", seats = 2, license_plate = "aaaaaaaa", make = "Honda", model = "Civic")
    @driver = driver
    @seats = seats
    @make = make
    @model = model
    @license_plate = license_plate
    @rider_list = []
  end
  def pickup(name)
    @rider_list << name
  end
end

class Taxi_Service
  attr_accessor :rider_queue, :taxi_queue
  def initialize
    @rider_queue = []
    @taxi_queue = []
  end
  def add_rider(rider)
    @rider_queue << rider
  end
  def add_taxi(taxi)
    @taxi_queue << taxi
  end
  def assign_taxi(taxi)
    taxi.seats.times do
      taxi.rider_list << @rider_queue.slice!(0,1)
    end
  end
  def send_taxi
    i = 0
    loop do
      assign_taxi(@taxi_queue[i])
      i += 1
    break if(@rider_queue == [] || i==@taxi_queue.length)
    end
  end
end

my_service = Taxi_Service.new
taxi1 = Taxi.new("Rikki")
taxi2 = Taxi.new("Eric")
taxi3 = Taxi.new("Evan")

my_service.add_rider("Kristen")
my_service.add_rider("Misun")
my_service.add_rider("Alyssa")
my_service.add_rider("Damon")
my_service.add_rider("Janice")
my_service.add_rider("Jez")
my_service.add_rider("Leila")
my_service.add_rider("Sunil")
my_service.add_rider("Julianne")
my_service.add_rider("Dakota")
my_service.add_rider("Andy E")

my_service.add_taxi(taxi1)
my_service.add_taxi(taxi2)
my_service.add_taxi(taxi3)

puts my_service.taxi_queue
p my_service.rider_queue
my_service.send_taxi
puts my_service.taxi_queue
p my_service.rider_queue


#slice taxis to taxi queue
