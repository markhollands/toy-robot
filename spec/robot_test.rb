require_relative '../robot'

describe "tests the different operations a robot can do" do
	it "robot faces east" do
		robot = Robot.new
		robot.face(:east)
		expect(robot.orientation).to eq(:east)
	end

	it "robot turns left" do
		robot = Robot.new
		robot.face(:north)
		robot.left

		expect(robot.orientation).to eq(:west)
	end

	it "robot turns right" do
		robot = Robot.new
		robot.face(:east)
		robot.right

		expect(robot.orientation).to eq(:south)
	end

	it "robot tries to turn left without having been faced" do
		robot = Robot.new
		robot.right
		expect(robot.orientation).to eq(nil)
	end

	it "robot is placed and reports" do
		robot = Robot.new
		robot.place(0,0,"EAST")
		expect(robot.report).to eq("0,0,EAST")
	end

	it "robot is placed and reports and moves" do
		robot = Robot.new
		robot.place(0,0,"NORTH")
		expect(robot.report).to eq("0,0,NORTH")
		robot.move
		expect(robot.report).to eq("0,1,NORTH")
		
	end
end