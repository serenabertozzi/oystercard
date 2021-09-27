require 'oystercard'
describe OysterCard do

    it 'has a balance' do
    card = OysterCard.new(0)
    expect(card.balance).to(eq(0))
    end

    it { is_expected.to respond_to(:top_up).with(1).argument}

    it "can be topped up" do
        card = OysterCard.new(0)
        card.top_up(5)
        expect(card.balance).to(eq(5))
    end
end
