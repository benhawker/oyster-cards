require 'oystercard'

describe Oystercard do

	let(:oystercard) { Oystercard.new }

	it "is created with a balance of zero" do
		expect(oystercard.balance).to eq (0)
	end

end