class Journey

	attr_accessor :origin_station, :destination_station

	BASE_FARE = 1
	PRICE_PER_ZONE = 1.2
	PENALTY_FARE = 5

	def initialize(origin_station)
		@origin_station = origin_station
		@destination_station = nil
		@status = "Pending"
	end

	def calculate_fare
		BASE_FARE + variable_trip_price
	end

	def complete_journey(destination_station)
		@destination_station = destination_station
		@status = "Complete"
	end

	def penalty_fare
		@status = "Penalty Fare"
	end

	private

	def completed?
		origin_station && destintion_station
	end

	def zones_crossed
		(origin_station.zone - destination_station.zone).abs
	end

  def variable_trip_price
    (zones_crossed * PRICE_PER_ZONE).round(2)
  end

end