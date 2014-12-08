class Map

	attr_reader :min_x, :min_y, :max_x, :max_y

	def initialize max_x, max_y
		@min_x = 0
		@min_y = 0
		@max_x = max_x
		@max_y = max_y
	end

	def valid_position?(x,y)
		return x >= @min_x && x < @max_x && y >= @min_y && y < @max_y
	end
end