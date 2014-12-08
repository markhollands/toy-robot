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
end