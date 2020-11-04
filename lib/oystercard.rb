class Oystercard
  LIMIT = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :entry_station

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(amount)
    fail "Balance exceeds limit of #{LIMIT}" if (@balance + amount) > LIMIT
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient funds" if @balance < MINIMUM_FARE

    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_FARE)

    @entry_station = nil
  end

  def in_journey?
    !!@entry_station
    # above is equivalent to '@entry_station != nil'
  end

  private
    def deduct(fare)
      @balance -= fare
    end

end
