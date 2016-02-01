require 'oystercard'

describe Oystercard do

  let(:oystercard) { Oystercard.new }
  let(:oystercard_20) { Oystercard.new(20) }
  let(:orchard) { Station.new(1) }
  let(:somerset) { Station.new(2) }

  context "on creation" do
    it "is created with a balance of zero by default" do
      expect(oystercard.balance).to eq (0)
    end

    it "can be created with a balance" do
      oystercard = Oystercard.new(20)
      expect(oystercard.balance).to eq (20)
    end

    it "cannot be created with a balance greater than 50" do
      expect { Oystercard.new(51) }.to raise_error "Max balance is #{Oystercard::MAX_BALANCE}"
    end
  end

  context "top up" do
    it "can be topped up with a specific amount" do
      oystercard.top_up(20)
      expect(oystercard.balance).to eq (20)
    end

    it "will raise error if new balance would exceed 50" do
      oystercard = Oystercard.new(20)
      expect { oystercard.top_up(31) }.to raise_error "This would take you over the max balance!"
    end

    it "will not be topped up if new balance would exceed 50" do
      oystercard = Oystercard.new(20)
      expect { oystercard.top_up(31) }.to raise_error "This would take you over the max balance!"
      expect(oystercard.balance).to eq (20)
    end
  end

  context "tap in" do
    it "creates a new journey" do
      oystercard_20.tap_in(orchard)
      #expect new journey
    end

    it "raises error if user has unsufficient funds" do
      oystercard = Oystercard.new(0.5)
      expect { oystercard.tap_in(orchard) }.to raise_error "You don't have enough for this journey :("
    end
  end

  context "tap out" do
    it "charges the correct fare for a valid journey" do
      oystercard_20.tap_in(orchard)
      oystercard_20.tap_out(somerset)
      expect(oystercard_20.balance).to eq (17.80)
    end

    it "deducts the penalty fare if user did not tap in" do
      oystercard_20.tap_out(somerset)
      expect(oystercard_20.balance).to eq (15.00)
    end
  end

end