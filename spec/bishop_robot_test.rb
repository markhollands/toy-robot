require_relative '../lib/bishop_robot'

describe "moving a bishop robot" do

	let(:robot) do
		BishopRobot.new
	end

	it "robot faces east" do
		robot.face(:east)
		expect(robot.placed?).to eq(false)
	end

	it "robot turns left" do
		robot.face(:northeast)
		robot.left

		expect(robot.orientation).to eq(:northwest)
	end

	it "robot turns right" do
		robot.face(:northeast)
		robot.right

		expect(robot.orientation).to eq(:southeast)
	end

	it "robot tries to turn left without having been faced" do
		robot.right
		expect(robot.orientation).to eq(nil)
	end

	it "robot is placed and reports" do
		robot.place(0,0,"NORTHEAST")
		expect(robot.report).to eq("0,0,NORTHEAST")
	end

	it "robot is placed and reports and moves" do
		robot.place(0,0,"NORTHEAST")
		expect(robot.report).to eq("0,0,NORTHEAST")
		robot.move
		expect(robot.report).to eq("1,1,NORTHEAST")
	end

	it "robots moves northeast" do
		robot.place(0,0,"NORTHEAST")
		robot.move
		expect(robot.report).to eq("1,1,NORTHEAST")
	end

	it "robots moves southwest" do
		robot.place(1,1,"SOUTHWEST")
		robot.move
		expect(robot.report).to eq("0,0,SOUTHWEST")
	end

	it "robots moves northwest" do
		robot.place(1,0,"NORTHWEST")
		robot.move
		expect(robot.report).to eq("0,1,NORTHWEST")
	end

	it "robots moves southeast" do
		robot.place(0,1,"SOUTHEAST")
		robot.move
		expect(robot.report).to eq("1,0,SOUTHEAST")
	end

	it "robots turns and then reports" do
		robot.place(0,0,"NORTHEAST")
		robot.left
		expect(robot.report).to eq("0,0,NORTHWEST")
	end

	it "robot moves and turns and moves" do
		robot.place(1,2,"SOUTHWEST")
		robot.move
		# robot.move
		robot.left
		robot.move
		expect(robot.report).to eq("1,0,SOUTHEAST")
	end

	it "robot tries to drive off the table" do
		robot.place(0,0, "SOUTHWEST")
		robot.move
		expect(robot.report).to eq("0,0,SOUTHWEST")
	end

	it "robot is invalidly placed" do 
		robot.place(5,5, "SOUTHEAST")
		expect(robot.placed?).to eq(false)

	end
end