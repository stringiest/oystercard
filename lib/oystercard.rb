class Oystercard
  LIMIT = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :entry_station, :journey_history

  def initialize
    @balance = 0
    @entry_station = nil
    @journey_history = []
  end

  def top_up(amount)
    fail "Balance exceeds limit of #{LIMIT}" if (@balance + amount) > LIMIT
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient funds" if @balance < MINIMUM_FARE
    update_entry_station(station)
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @entry_station = nil
    update_exit_station(station)
  end

  def in_journey?
    !!@entry_station
    # above is equivalent to '@entry_station != nil'
  end

  private
    def deduct(fare)
      @balance -= fare
    end

    def update_entry_station(station)
      @entry_station = station
      @journey_history << {entry: station}
    end

    def update_exit_station(station)
      @journey_history.last[:exit] = station
    end

end
