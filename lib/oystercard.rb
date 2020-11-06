require_relative "journey"

class Oystercard
  LIMIT = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :journey_history, :journey

  def initialize
    @balance = 0
    @journey
    @journey_history = []
  end

  def top_up(amount)
    fail "Balance exceeds limit of #{LIMIT}" if (@balance + amount) > LIMIT
    @balance += amount
  end

  def touch_in(station)
    charge_and_reset if in_journey?

    fail "Insufficient funds" if @balance < MINIMUM_FARE
    @journey = Journey.new(station)
  end

  def touch_out(station)
    @journey = Journey.new if !in_journey?
    @journey.finish(station)
    charge_and_reset
  end

  def in_journey?
    return false if @journey == nil
    !@journey.complete?
  end

  private
    def deduct(fare)
      @balance -= fare
    end

    def charge_and_reset
      deduct(@journey.fare)
      @journey_history << @journey
      @journey = nil
    end

end
