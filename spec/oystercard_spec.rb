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
	end

	context "top up" do
		it "can be topped up with a specific amount" do
			oystercard.top_up(20)
			expect(oystercard.balance).to eq (20)
		end
	end



end