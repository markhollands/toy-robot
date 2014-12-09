require_relative '../lib/keyboard_command_parser'

describe "parses keyboard commands" do
	it "parses a place command" do
		command = KeyboardCommandParser.parse("PLACE,0,1,NORTH")
		expect(command[:type]).to eq("PLACE")
		expect(command[:x]).to eq(0)
		expect(command[:y]).to eq(1)
		expect(command[:facing]).to eq("NORTH")
	end

	it "parses a left command" do
		command = KeyboardCommandParser.parse("LEFT")
		expect(command[:type]).to eq("LEFT")
	end

	it "parses a right command" do
		command = KeyboardCommandParser.parse("RIGHT")
		expect(command[:type]).to eq("RIGHT")
	end

	it "parses a move command" do
		command = KeyboardCommandParser.parse("MOVE")
		expect(command[:type]).to eq("MOVE")
	end

	it "parses a report command" do
		command = KeyboardCommandParser.parse("REPORT")
		expect(command[:type]).to eq("REPORT")
	end
end