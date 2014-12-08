require_relative 'directions'

class Robot
	# The direction the robot is currently facing
	attr_accessor :orientation

	# Turns the robot to face a particular direction
	# Params: 
	# +direction+:: A symbol representing one of the 4 compass directions
	def face(direction)
		if Directions.exists(direction)
			self.orientation = direction
		else
			nil
		end
	end

	# Makes the robot turn left 90 degrees from its current position
	def left
		self.orientation = get_updated_direction(Directions.turn_left)
	end

	# Makes the robot turn right 90 degress from its current position
	def right
		self.orientation = get_updated_direction(Directions.turn_right)
	end

	private

	# Get the current index of the 
	def get_current_direction_degrees
		Directions.get_degrees(self.orientation)
	end

	# Calculates a new direction based upon a turn
	def get_updated_direction(turn_direction)

		new_orientation = get_current_direction_degrees

		# If the robot hasn't been orientated, return nil
		if (new_orientation.nil?)
			return nil
		end
		# Update the orientation index
		new_orientation += turn_direction
		# Make sure the index isn't negative or outside of the array bounds
		if (new_orientation < 0)
			new_orientation += Directions.total_degrees
		elsif (new_orientation >= Directions.total_degrees)
			new_orientation % Directions.total_degrees			
		end
		return Directions.get_direction(new_orientation)
	end
end