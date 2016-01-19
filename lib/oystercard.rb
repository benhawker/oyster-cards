class Oystercard
	attr_reader :balance

	MAX_BALANCE = 50

	def initialize(balance=0)
		@balance = balance
	end


	def top_up(amount)
		@balance += amount
	end

end
