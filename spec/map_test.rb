require_relative '../lib/map'

describe "Test map position validity" do 

	it "tests a map position" do
		map = Map.new(5,5)

		expect(map.valid_position?(0,0)).to eq(true)
		expect(map.valid_position?(1,2)).to eq(true)
		expect(map.valid_position?(4,4)).to eq(true)
		expect(map.valid_position?(5,5)).to eq(false)
		expect(map.valid_position?(-1,0)).to eq(false)
		expect(map.valid_position?(6,4)).to eq(false)
		expect(map.valid_position?(4,7)).to eq(false)
	end

end