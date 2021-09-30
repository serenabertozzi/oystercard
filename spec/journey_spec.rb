require "journey"

describe Journey do
  it "knows if a journey is not complete" do
    expect(subject).not_to be_complete
  end

  it "penalty fare by default" do
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end
end
