require 'robot'

class BishopRobot < Robot

	@@accepted_directions = [:northeast, :northwest, :southeast, :southwest]

	# Get the diagonal updated move coordinates
	def move_coordinates
		target_x = @x
		target_y = @y

		case @orientation
		when :northeast
			target_y += 1
			target_x += 1
		when :southeast
			target_y += -1
			target_x += 1
		when :northwest 
			target_x += -1
			target_y += 1
		when :southwest
			target_x += -1
			target_y += -1
		end
		return {:x => target_x, :y => target_y}
	end

end