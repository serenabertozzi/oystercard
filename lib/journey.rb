class Journey
  PENALTY_FARE = 6

  attr_reader :entry_station

  def initialize(entry_station = nil)
    @journey = {}
    @entry_station = entry_station
  end

  def complete?
    !@journey.empty?
  end

  def fare
    PENALTY_FARE
  end

  def finish(station)
    self
  end
end
