require "oystercard"
describe OysterCard do
  subject { OysterCard.new(90) }

  it "has a balance" do
    card = OysterCard.new(0)
    expect(card.balance).to(eq(0))
  end

  describe "#top_up" do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "can be topped up" do
      card = OysterCard.new(0)
      card.top_up(5)
      expect(card.balance).to(eq(5))
    end

    it "raises an error, when trying to top up, but it reached max balance" do
      max_balance = OysterCard::MAX_BALANCE
      card = OysterCard.new(0)
      card.top_up(max_balance)
      expect { card.top_up(1) }.to raise_error "Your balance reached £#{max_balance}, it cannot be topped up"
    end
  end

  describe "#journey" do
    it { is_expected.to respond_to :touch_in }
    it { is_expected.to respond_to :touch_out }

    it "is initially not in a journey" do
      expect(subject).not_to be_in_journey
    end

    it "can touch in" do
      subject.touch_in(station)
      expect(subject).to be_in_journey
    end

    it "can touch out" do
      subject.touch_in(station)
      subject.touch_out(station)
      expect(subject).not_to be_in_journey
    end

    it "raises an error, if the balance is too low" do
      card = OysterCard.new(0)
      expect { card.touch_in(station) }.to raise_error "Balance is too low"
    end

    it "can deduct the minimum charge from the balance" do
      subject.touch_out(station)
      expect { subject.touch_out(station) }.to change { subject.balance }.by(-1)
    end
  end

  let(:station) { double :station }

  it "stores the entry station" do
    subject.touch_in(station)
    expect(subject.entry_station).to eq station
  end

  it "stores the exit station" do
    subject.touch_out(station)
    expect(subject.exit_station).to eq station
  end

it 'is an empty list of journeys' do 
  expect(subject.journeys).to eq ([])
end

it 'creates a journey' do
  subject.touch_in("London")
  subject.touch_out("Glasgow")
  expect(subject.journeys).to eq([{:entry=>"London", :exit=>"Glasgow"}])
end

end
