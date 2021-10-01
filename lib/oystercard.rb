require 'journey'

class OysterCard
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  attr_reader :balance, :journeys

  def initialize(balance = 0)
    @balance = balance
    @journeys = []
  end

  def top_up(amount)
    fail "Your balance reached £#{MAX_BALANCE}, it cannot be topped up" if (@balance + amount) > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Balance is too low" if @balance < MIN_BALANCE
    @journeys << Journey.new(station)
  end

  def touch_out(station)
    @journeys.last.finish(station)
    deduct(MIN_BALANCE)
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
