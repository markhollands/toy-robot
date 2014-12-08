class Robot

	DIRECTIONS = [:north, :east, :south, :west]

	attr_accessor :orientation

	def face(direction)
		if DIRECTIONS.include?(direction)
			self.orientation = direction
		else
			nil
		end
	end

	def left
		self.orientation = get_updated_direction(DIRECTIONS.index(self.orientation) - 1)
	end

	def right
		self.orientation = get_updated_direction(DIRECTIONS.index(self.orientation) + 1)
	end

	def get_updated_direction(new_orientation)

		if (new_orientation < 0)
			new_orientation += DIRECTIONS.count
		elsif (new_orientation >= DIRECTIONS.count)
			new_orientation % DIRECTIONS.count			
		end
		return DIRECTIONS[new_orientation]
	end
end