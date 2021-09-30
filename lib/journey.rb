class Journey
  PENALTY_FARE = 6

  def initialize
    @journey = { exit_station: nil }
  end

  def complete?
    @journey[:exit_station]
  end

  def fare
    PENALTY_FARE
  end
end
