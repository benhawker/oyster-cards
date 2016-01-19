require 'journey'
require 'station'

describe Journey do

	let(:station_one) { Station.new(1) }
	let(:station_two) { Station.new(2) }
	let(:station_four) { Station.new(4) }

	context "validations" do
		it "is not valid without an origin and a destination" do
			expect { Journey.new }.to raise_error
		end

		xit "is valid with an origin and a destination station" do
			journey = Journey.new(station_one, station_two)
			expect(journey).to be_valid
		end
	end

	context "calculates number of zones crossed" do
		it "from zone 1 to zone 4" do
			journey = Journey.new(station_one, station_four)
			expect(journey.send(:zones_crossed)).to eq (3)
		end

		it "from zone 4 to zone 2" do
			journey = Journey.new(station_four, station_one)
			expect(journey.send(:zones_crossed)).to eq (3)
		end

		it "from zone 3 to zone 3" do
			journey = Journey.new(station_four, station_four)
			expect(journey.send(:zones_crossed)).to eq (0)
		end
	end


	context "calculates the variable fare" do
		it "from zone 1 to zone 4" do
			journey = Journey.new(station_one, station_four)
			expect(journey.send(:variable_trip_price)).to eq (3.60)
		end

		it "from zone 4 to zone 2" do
			journey = Journey.new(station_four, station_one)
			expect(journey.send(:variable_trip_price)).to eq (3.60)
		end
	end

	context "calculates the total fare" do
		it "from zone 1 to zone 4" do
			journey = Journey.new(station_one, station_four)
			expect(journey.calculate_fare).to eq (4.60)
		end

		it "from zone 4 to zone 2" do
			journey = Journey.new(station_four, station_one)
			expect(journey.calculate_fare).to eq (4.60)
		end
	end
end
