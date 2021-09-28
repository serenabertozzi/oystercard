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
