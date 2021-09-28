class OysterCard
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  attr_reader :balance, :entry_station

  def initialize(balance = 0)
    @balance = balance
    @entry_station = nil
  end

  def top_up(amount)
    fail "Your balance reached £#{MAX_BALANCE}, it cannot be topped up" if @balance >= MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Balance is too low" if @balance < MIN_BALANCE
    @entry_station = station
  end

  def touch_out
    deduct(MIN_BALANCE)
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
