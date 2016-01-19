class Journey

	attr_reader :origin, :destination

	BASE_FARE = 1
	PRICE_PER_ZONE = 1.2

	def initialize(origin, destination)
		@origin = origin
		@destination = destination
	end

	def calculate_fare
		BASE_FARE + variable_trip_price
	end

	private

	def zones_crossed
		(origin.zone - destination.zone).abs
	end

  def variable_trip_price
    (zones_crossed * PRICE_PER_ZONE).round(2)
  end

end