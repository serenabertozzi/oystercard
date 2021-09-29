class OysterCard
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  attr_reader :balance, :entry_station, :journeys, :exit_station

  def initialize(balance = 0)
    @balance = balance
    @entry_station = nil
    @journeys = []
    @exit_station = nil
  end

  def top_up(amount)
    fail "Your balance reached £#{MAX_BALANCE}, it cannot be topped up" if (@balance + amount) > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Balance is too low" if @balance < MIN_BALANCE
    @entry_station = station

  end

  def touch_out(station)
    deduct(MIN_BALANCE)
  
    @exit_station = station
    create_journey(@entry_station, @exit_station)
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def create_journey(entry_station, exit_station)
    @journeys << {entry: @entry_station, exit: @exit_station }
  end
end
