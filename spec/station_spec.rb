require "station"

describe Station do

	let(:station) { Station.new }
  
  context "zones" do
  	it { is_expected.to respond_to(:zone) }
	  
	  it "defaults to Zone 1" do
	    expect(station.zone).to eq 1
	  end

	  it "can be intialized with another zone" do
	  	station = Station.new(4)
	    expect(station.zone).to eq 4
	  end

	  it "raises an error if the zone is greater than 5" do
	    expect { Station.new(6) }.to raise_error "We only have 5 zones"
	  end
	end

end
