require_relative '../robot'

describe "tests the different operations a robot can do" do

	let(:robot) do
		Robot.new
	end

	it "robot faces east" do
		robot.face(:east)
		expect(robot.orientation).to eq(:east)
	end

	it "robot turns left" do
		robot.face(:north)
		robot.left

		expect(robot.orientation).to eq(:west)
	end

	it "robot turns right" do
		robot.face(:east)
		robot.right

		expect(robot.orientation).to eq(:south)
	end

	it "robot tries to turn left without having been faced" do
		robot.right
		expect(robot.orientation).to eq(nil)
	end

	it "robot is placed and reports" do
		robot.place(0,0,"EAST")
		expect(robot.report).to eq("0,0,EAST")
	end

	it "robot is placed and reports and moves" do
		robot.place(0,0,"NORTH")
		expect(robot.report).to eq("0,0,NORTH")
		robot.move
		expect(robot.report).to eq("0,1,NORTH")
	end

	it "robots turns and then reports" do
		robot.place(0,0,"NORTH")
		robot.left
		expect(robot.report).to eq("0,0,WEST")
	end

	it "robot moves and turns and moves" do
		robot.place(1,2,"EAST")
		robot.move
		robot.move
		robot.left
		robot.move
		expect(robot.report).to eq("3,3,NORTH")
	end

	it "robot tries to drive off the table" do
		robot.place(0,0, "WEST")
		robot.move
		expect(robot.report).to eq("0,0,WEST")
	end

	it "robot is invalidly placed" do 
		robot.place(5,5, "EAST")
		expect(robot.placed?).to eq(false)

	end
end