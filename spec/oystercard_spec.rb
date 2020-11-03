require 'oystercard'

describe Oystercard do

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

end
