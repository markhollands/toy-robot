class Directions

	# The compass directions
	TOTAL_DEGREES = 360
	# Mappings of directions onto degrees
	DIRECTIONS_TO_DEGREES = {:north => 0, :east => 90, :south => 180, :west => 270}
	# Mappings of degrees onto directions
	DEGREES_TO_DIRECTIONS = Hash[DIRECTIONS_TO_DEGREES.map { |k, v| [v, k] }]

	# Mappings of command names onto symbols
	NAMED_DIRECTIONS = {"NORTH" => :north, "EAST" => :east, "SOUTH" => :south, "WEST" => :west}
	DIRECTION_NAMES = Hash[NAMED_DIRECTIONS.map { |k, v| [v, k] }]
	def self.total_degrees
		return TOTAL_DEGREES
	end	

	def self.named_directions
		NAMED_DIRECTIONS.keys
	end

	def self.named_direction(direction_name)
		NAMED_DIRECTIONS[direction_name]
	end

	def self.direction_name(direction)
		DIRECTION_NAMES[direction]
	end

	def self.exists(direction)
		DIRECTIONS_TO_DEGREES.has_key?(direction)
	end

	def self.directions
		DIRECTIONS_TO_DEGREES.keys
	end

	def self.get_direction(degrees)
		DEGREES_TO_DIRECTIONS[degrees]
	end

	def self.get_degrees(direction)
		DIRECTIONS_TO_DEGREES[direction]
	end

	# Turn operations as indices
	def self.turn_left
	 	return -90
	end

	def self.turn_right
		return 90
	end
end