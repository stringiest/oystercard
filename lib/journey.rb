require_relative 'journey_log'

class Journey
  MINIMUM_FARE = 1
  PENALTY_FARE = 6
  attr_reader :entry_station, :exit_station

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station
  end

  def finish(exit_station)
    @exit_station = exit_station
    self # resets exit_station to nil
  end

  def complete?
    @entry_station != nil && @exit_station != nil
  end

  def fare
    return PENALTY_FARE if !complete?
    MINIMUM_FARE
  end


end
