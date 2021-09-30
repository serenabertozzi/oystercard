class Journey
  PENALTY_FARE = 6

  attr_reader :entry_station

  def initialize(entry_station = nil)
    @entry_station = entry_station
  end

  def complete?
    @exit_station
  end

  def fare
    return PENALTY_FARE unless @exit_station
    1
  end

  def finish(station)
    @exit_station = station
    self
  end
end
