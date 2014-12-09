require_relative 'map'
require_relative 'robot'
require_relative 'keyboard_command_parser'

class Simulator

	def initialize()
		puts "Creating the robot"
		@map = Map.new(5,5)
		@robot = Robot.new(@map)

		input = STDIN.gets
		while input
		  command = KeyboardCommandParser.parse(input)

		  if (!command.nil?)
		    case command[:type]
			  when "PLACE"
			  	@robot.place(command[:x], command[:y], command[:facing])
			  when "REPORT"
			  	puts @robot.report
			  when "MOVE"
			  	@robot.move
			  when "LEFT"
			  	@robot.left
			  when "RIGHT"
			  	@robot.right
			  end
			end
		  input = STDIN.gets
		end
	end
end