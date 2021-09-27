require 'oystercard'
describe OysterCard do

    it 'has a balance' do
    card = OysterCard.new(0)
    expect(card.balance).to(eq(0))
    end

    describe "#top_up" do
        it { is_expected.to respond_to(:top_up).with(1).argument}

        it "can be topped up" do
            card = OysterCard.new(0)
            card.top_up(5)
            expect(card.balance).to(eq(5))
        end

        it "raises an error, when trying to top up, but it reached max balance" do
            max_balance = OysterCard::MAX_BALANCE
            card = OysterCard.new(0)
            card.top_up(max_balance)
            expect {card.top_up(1)}.to raise_error "Your balance reached £#{max_balance}, it cannot be topped up"
        end
    end

    describe "#deduct" do
        it { is_expected.to respond_to(:deduct).with(1).argument}

        it "an amount can be deducted from the balance of the card" do
            card = OysterCard.new(90)
            card.deduct(50)
            expect(card.balance).to(eq(40))
        end
    end


end
