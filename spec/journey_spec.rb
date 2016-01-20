require 'journey'
require 'station'

describe Journey do

	let(:station_one) { Station.new(1) }
	let(:station_two) { Station.new(2) }
	let(:station_four) { Station.new(4) }

	context "validations" do
		it "is not valid without an origin" do
			expect { Journey.new }.to raise_error
		end

		xit "is valid with an origin station" do
			journey = Journey.new(station_one)
			expect(journey).to be_valid
		end
	end

	describe "complete" do
		context "calculates number of zones crossed" do
			it "from zone 1 to zone 4" do
				journey = Journey.new(station_one)
				journey.complete_journey(station_four)
				expect(journey.send(:zones_crossed)).to eq (3)
			end

			it "from zone 4 to zone 2" do
				journey = Journey.new(station_four)
				journey.complete_journey(station_two)
				expect(journey.send(:zones_crossed)).to eq (2)
			end

			it "from zone 4 to zone 4" do
				journey = Journey.new(station_four)
				journey.complete_journey(station_four)
				expect(journey.send(:zones_crossed)).to eq (0)
			end
		end


		context "calculates the variable fare" do
			it "from zone 1 to zone 4" do
				journey = Journey.new(station_one)
				journey.complete_journey(station_four)
				expect(journey.send(:variable_trip_price)).to eq (3.60)
			end

			it "from zone 4 to zone 2" do
				journey = Journey.new(station_four)
				journey.complete_journey(station_two)
				expect(journey.send(:variable_trip_price)).to eq (2.40)
			end
		end

		context "calculates the total fare" do
			it "from zone 1 to zone 4" do
				journey = Journey.new(station_one)
				journey.complete_journey(station_four)
				expect(journey.calculate_fare).to eq (4.60)
			end

			it "from zone 4 to zone 2" do
				journey = Journey.new(station_four)
				journey.complete_journey(station_two)
				expect(journey.calculate_fare).to eq (3.40)
			end
		end
	end

end
