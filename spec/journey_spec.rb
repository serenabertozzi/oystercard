require "journey"

describe Journey do
  let(:station) { instance_double("Station", :zone => 1) }

  it "knows if a journey is not complete" do
    expect(subject).not_to be_complete
  end

  it "penalty fare by default" do
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end

  it "returns itself when exiting a journey" do
    expect(subject.finish(station)).to eq subject
  end

  context "when given an entry station" do
    subject { described_class.new(station) }

    it "has an entry station" do
      expect(subject.entry_station).to eq station
    end

    it "returns a penalty fare if no exit station is given" do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

    context "when given an exit station" do
      let(:other_station) { double :other_station }

      before do
        subject.finish(other_station)
      end

      it "calculates a fare" do
        expect(subject.fare).to eq 1
      end

      it "knows if a journey is complete" do
        expect(subject).to be_complete
      end
    end
  end
end
