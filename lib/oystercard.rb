class Oystercard
  LIMIT = 90
  MINIMUM_FARE = 1
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Balance exceeds limit of #{LIMIT}" if (@balance + amount) > LIMIT
    @balance += amount
  end

  def touch_in
    fail "Insufficient funds" if @balance < MINIMUM_FARE
    @in_journey = true
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  private
    def deduct(fare)
      @balance -= fare
    end

end
