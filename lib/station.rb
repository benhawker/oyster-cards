class Station

	attr_reader :zone

	MAX_ZONE = 5

	def initialize(zone = 1)
		raise "We only have 5 zones" if zone > MAX_ZONE
		@zone = zone
	end

end