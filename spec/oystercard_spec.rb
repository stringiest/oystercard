require 'oystercard'

describe Oystercard do

  it "has an opening balance of zero" do
    expect(subject.balance).to eq 0
  end
end
