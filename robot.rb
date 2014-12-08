class Robot

	# The directions the robot is aware of
	DIRECTIONS = [:north, :east, :south, :west]

	TURN_LEFT = -1
	TURN_RIGHT = 1


	# The direction the robot is currently facing
	attr_accessor :orientation

	# Turns the robot to face a particular direction
	# Params: 
	# +direction+:: A symbol representing one of the 4 compass directions
	def face(direction)
		if DIRECTIONS.include?(direction)
			self.orientation = direction
		else
			nil
		end
	end

	# Makes the robot turn left 90 degrees from its current position
	def left
		self.orientation = get_updated_direction(TURN_LEFT)
	end

	# Makes the robot turn right 90 degress from its current position
	def right
		self.orientation = get_updated_direction(TURN_RIGHT)
	end

	private

	# Calculates a new position based upon a direction index
	def get_current_direction_index
		DIRECTIONS.index(self.orientation)
	end

	def get_updated_direction(turn_direction)

		new_orientation = get_current_direction_index

		# If the robot hasn't been orientated, return nil
		if (new_orientation.nil?)
			return nil
		end

		# Update the orientation index
		new_orientation += turn_direction

		# Make sure the index isn't negative or outside of the array bounds
		if (new_orientation < 0)
			new_orientation += DIRECTIONS.count
		elsif (new_orientation >= DIRECTIONS.count)
			new_orientation % DIRECTIONS.count			
		end
		return DIRECTIONS[new_orientation]
	end
end