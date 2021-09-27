class OysterCard
  MAX_BALANCE = 90
attr_reader :balance
  def initialize(balance = 0)
    @balance = balance
    @journey = false
  end

  def top_up(amount)
    fail "Your balance reached £#{MAX_BALANCE}, it cannot be topped up" if @balance >= MAX_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @journey = true
  end

  def touch_out
    @journey = false
  end

  def in_journey?
    @journey == true
  end

end