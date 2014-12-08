require_relative '../directions'

describe "testing compass directions" do 
	it "gets west degrees" do
		expect(Directions.get_degrees(:west)).to eq(270)
	end

	it "gets 270 degrees" do
		expect(Directions.get_direction(270)).to eq(:west)
	end
	
end