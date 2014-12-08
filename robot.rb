require_relative 'directions'
require_relative 'map'

class Robot

	# The direction the robot is currently facing
	def initialize(map=nil)
		@map = map.nil? ? Map.new(5,5) : map

	 	@orientation = nil
	 	@x = nil
	 	@y = nil
	 	@placed = false
	end

	# Get whether the robot has been successfully placed or not
	def placed?
		@placed
	end

	# Turns the robot to face a particular direction
	# Params: 
	# +direction+:: A symbol representing one of the 4 compass directions
	def face(direction)
		if Directions.exists(direction)
			@orientation = direction
		else
			nil
		end
	end

	# Attempt to place a robot at an x,y coordinate facing in a particular direction
	# Params:
	# +x+:: X coordinate
	# +y+:: Y coordinate
	# +direction+:: Compass direction
	def place(x,y,direction)
		raise "The direction must be one of #{Directions.named_directions}" unless !Directions.named_direction(direction).nil?
		
		if (@map.valid_position?(x,y))
			@x = x
			@y = y
			@orientation = Directions.named_direction(direction)
			@placed = true
		end
	end

	# Get the robots current state
	def report
		return "#{@x},#{@y},#{Directions.direction_name(@orientation)}"
	end

	# Attempt to move the robot 1 square forward in its current direction
	def move
		target_x = @x
		target_y = @y

		case @orientation
		when :north
			target_y += 1
		when :south
			target_y += -1
		when :east 
			target_x += 1
		when :west
			target_x += -1
		end

		if (@map.valid_position?(target_x, target_y))
			@x = target_x
			@y = target_y
		end
	end

	# Get the robots current orientation
	def orientation
		return @orientation
	end

	# Makes the robot turn left 90 degrees from its current position
	def left
		@orientation = get_updated_direction(Directions.turn_left)
	end

	# Makes the robot turn right 90 degress from its current position
	def right
		@orientation = get_updated_direction(Directions.turn_right)
	end

	private

	# Get the current index of the 
	def get_current_direction_degrees
		Directions.get_degrees(@orientation)
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