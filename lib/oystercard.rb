require "./lib/journey"

class Oystercard

  attr_reader :balance

  MIN_BALANCE = 1
  MAX_BALANCE = 50

  def initialize(balance=0)
    raise "Max balance is #{Oystercard::MAX_BALANCE}" if exceeds_max_balance?(balance)
    @balance = balance
  end

  def top_up(amount)
    raise "This would take you over the max balance!" if exceeds_max_balance?(@balance + amount)
    @balance += amount
  end

  def tap_in(origin_station)
    raise "You don't have enough for this journey :(" if below_min_balance?(@balance)
    @journey = Journey.new(origin_station)
  end

  def tap_out(destination_station)
    if @journey
      @journey.complete_journey(destination_station)
      deduct(@journey.calculate_fare)
    else
      deduct(Journey::PENALTY_FARE)
    end
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def below_min_balance?(balance)
    true if balance < MIN_BALANCE
  end

  def exceeds_max_balance?(balance)
    true if balance > MAX_BALANCE
  end

end
