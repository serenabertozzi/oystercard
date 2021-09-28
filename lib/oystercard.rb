class OysterCard
  MAX_BALANCE = 90
  MIN_BALANCE = 1
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
    fail "Balance is too low" if @balance < MIN_BALANCE
    @journey = true
  end

  def touch_out
    @journey = false
  end

  def in_journey?
    @journey == true
  end

end
