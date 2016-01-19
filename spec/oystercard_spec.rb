require 'oystercard'

describe Oystercard do

	let(:oystercard) { Oystercard.new }

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



end