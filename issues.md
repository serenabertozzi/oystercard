NameError
spec_rb:2
Class has not been defined

---------

OysterCard 
MAX_BALANCE = 90
balance = 0
top_up(money)
fail "Your balance reached £#{MAX_BALANCE}, it cannot be topped up" if balance >= MAX_BALANCE
balance += money

MIN_BALANCE = 1
touch_in 
fail "Balance is too low" if @balance <= MIN_BALANCE


@journey = []

@entry_station = nil

attr_reader :entry_station
touch_in(station)
@entry_station = station

[{entry: station, exit: station}, {entry: station, exit: station}], {entry: station, exit: station}]]



class Station

attr_reader :station, :zone

  def initialize(station, zone)
    @station = station
    @zone = zone
  end
end
