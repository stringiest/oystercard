require 'journey_log'

describe JourneyLog do

  let(:station) { double :station }
  # # let(:exit_station) { double :station }
  let(:journey) { double :journey, entry_station: station }
  let(:journey_class) { double :journey_class, new: journey }
  subject(:journey_log) {described_class.new(journey_class: journey_class)}

  # it "starts a journey" do
  #   # get station into journey_log start_journey
  #
  #   subject.start(station)
  #   # expect entry_station to equal station passed above
  #   expect(subject.journey.station).to eq station
  # end

  it 'starts a journey' do
expect(journey_class).to receive(:new).with(entry_station: station )
journey_log.start(station)
  end

  it "returns a list of all previous journeys" do
    expect(subject.journeys.length).to eq 1
  end

end
