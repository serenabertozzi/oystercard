require "oystercard"

describe OysterCard do
  let(:balance) { 80 }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  subject { OysterCard.new(balance) }
  let(:journey) { Journey.new(entry_station) }

  it "has a balance" do
    expect(subject.balance).to(eq(balance))
  end

  describe "#top_up" do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "can be topped up" do
      expect { subject.top_up(5) }.to change { subject.balance }.by 5
    end

    it "raises an error, when trying to top up, but it reached max balance" do
      max_balance = OysterCard::MAX_BALANCE
      amount_over_limit = 11
      expect { subject.top_up(amount_over_limit) }.to raise_error "Your balance reached £#{max_balance}, it cannot be topped up"
    end
  end

  describe "#journey" do
    it { is_expected.to respond_to :touch_in }
    it { is_expected.to respond_to :touch_out }

    it "can touch in" do
      result = subject.touch_in(entry_station)
      expect(result).to be_an_instance_of(Journey)
    end

    it "can touch out" do
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject).not_to be_in_journey
    end

    it "raises an error, if the balance is too low" do
      below_minimum_far = 0
      card = OysterCard.new(below_minimum_far)

      expect { card.touch_in(entry_station) }.to raise_error "Balance is too low"
    end

    it "can deduct the minimum charge from the balance" do
      subject.touch_out(exit_station)
      expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-1)
    end
  end

  it "stores the entry station" do
    subject.touch_in(entry_station)
    expect(subject.entry_station).to eq entry_station
  end

  it "stores the exit station" do
    subject.touch_out(exit_station)
    expect(subject.exit_station).to eq exit_station
  end

  it "is an empty list of journeys" do
    expect(subject.journeys).to eq ([])
  end

  it "creates a journey" do
    journey = { :entry => entry_station, :exit => exit_station }
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)

    expect(subject.journeys).to include(journey)
  end
end
