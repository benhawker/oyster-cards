require 'journey'
require 'station'

describe Journey do

	let (:station_one) { Station.new(1) }
	let (:station_two) { Station.new(2) }

	it "is not valid without an origin and a destination" do
		expect { Journey.new }.to raise_error
	end

	it "is valid with an origin and a destination station" do
		journey = Journey.new(station_one, station_two)
		expect(journey).to be_valid
	end

end