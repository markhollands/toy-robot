require_relative 'map'
require_relative 'robot'

class Simulator

	def initialize
		@map = Map.new
		@robot = Robot.new
	end
end