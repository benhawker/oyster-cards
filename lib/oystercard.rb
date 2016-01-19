class Oystercard

	attr_reader :balance

	MAX_BALANCE = 50

	def initialize(balance=0)
		raise "Max balance is #{Oystercard::MAX_BALANCE}" if exceeds_max_balance?(balance)
		@balance = balance
	end

	def top_up(amount)
		raise "This would take you over the max balance!" if exceeds_max_balance?(@balance + amount)
		@balance += amount
	end

	private

	def exceeds_max_balance?(balance)
		true if balance > MAX_BALANCE
	end

end
