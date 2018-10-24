require 'rspec'
require_relative 'Taxi'

describe Taxi do
  before do
    @new_taxi1 = Taxi.new("Morgan Freeman", 3, "XYENDK34", "Toyota", "Prius")
  end
  it "has to be real" do
    expect{Taxi.new("Morgan Freeman", 3, "XYENDK34", "Toyota", "Prius")}.to_not raise_error
  end
  it "has attributes" do
    expect(@new_taxi1.driver).to be_a String
    expect(@new_taxi1.seats).to be_a Integer
  end
  it "can pickup riders" do
    @new_taxi1.pickup("George")
    expect(@new_taxi1.rider_list).to eq(["George"])
  end
end

describe Taxi_Service do
  before do
    @service1 = Taxi_Service.new
    @taxi1 = Taxi.new()
  end
  it "has to be real" do
    expect{Taxi_Service.new}.to_not raise_error
  end
  it "has attributes that start empty" do
    expect(@service1.rider_queue).to eq([])
    expect(@service1.taxi_queue).to eq([])
  end
  it "can add a rider" do
    @service1.add_rider("Erik")
    expect(@service1.rider_queue).to eq(["Erik"])
  end
  it "can add taxi to queue" do
    @service1.add_taxi(@taxi1)
    expect(@service1.taxi_queue).to eq([@taxi1])
  end
  it "can add riders from queue to taxi list" do
    @service1.add_rider("John")
    @service1.add_rider("Jacob")
    @service1.add_rider("JingleHeimer")
    @service1.add_rider("Schmidt")
    @service1.assign_taxi(@taxi1)
    expect(@service1.rider_queue).to eq(["JingleHeimer", "Schmidt"])
  end
end
