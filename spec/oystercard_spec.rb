require 'oystercard'
require 'journey'

describe Oystercard do

let(:station) { double :station }
let(:station2) { double :station }

  it "has an opening balance of zero" do
    expect(subject.balance).to eq 0
  end

  describe "#top_up" do

    it "responds to top-up method" do
      expect(subject).to respond_to(:top_up).with(1).argument
    end

    it "increases balance" do
      expect { subject.top_up(5) }.to change { subject.balance }.by 5
    end

    it "raises an error if try to top balance up over £90" do
      maximum_balance = Oystercard::LIMIT
      subject.top_up(maximum_balance)
      expect { subject.top_up(1) }.to raise_error "Balance exceeds limit of #{maximum_balance}"
    end
  end

  # removed 'describe "#deduct" do' tests as no longer relevant

  describe "#in_journey?" do

    it 'is initially not in a journey' do
      expect(subject).not_to be_in_journey
    end

    it "can touch in" do
      subject.top_up(20)
      subject.touch_in(station)
      expect(subject).to be_in_journey
    end

    it "can touch out" do
      subject.top_up(20)
      subject.touch_in(station)
      subject.touch_out(station2)
      expect(subject).not_to be_in_journey
    end

  end

  describe "#touch_in" do

    it "raises an error if balance < 1" do
      expect { subject.touch_in station }.to raise_error "Insufficient funds"
    end

    it "stores entry station" do
      subject.top_up(20)
      subject.touch_in(station)
      expect(subject.journey.entry_station).to eq station
    end

    it "checks if there is already an active journey" do
      subject.top_up(20)
      subject.touch_in(station)
      expect { subject.touch_in(station) }.to change { subject.balance }.by -6
    end
  end

  describe "#touch_out" do

    it "decreases balance by minimum fare" do
      subject.top_up(20)
      subject.touch_in(station)
      expect { subject.touch_out station2 }.to change { subject.balance }.by -Oystercard::MINIMUM_FARE
    end

  end

  describe "#journey_history" do

    it "initializes an empty array" do
      expect(subject.journey_history).to eq []
    end

    it "add journey to journey_history array" do
      subject.top_up(20)
      subject.touch_in(station)
      subject.touch_out(station2)
      expect(subject.journey_history[0]).to be_an_instance_of Journey
    end

  end

end
