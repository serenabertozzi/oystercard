require 'oystercard'
describe OysterCard do

    it 'has a balance' do
    card = OysterCard.new(0)
    expect(card.balance).to(eq(0))
    end
end