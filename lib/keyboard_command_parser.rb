class KeyboardCommandParser

	attr_reader :commands

	def self.parse(input)
		@commands = []
	 	
	 	command_split = input.strip.split(",")
	 	case command_split[0]
	 	when "PLACE"
	 		type, x, y, facing = command_split
	 		begin
	 			command = {:type => type, :x => Integer(x), :y => Integer(y), :facing => facing}
		 	rescue
		 		puts "X,Y Coordinates must be numbers"
		 		return nil
		 	end
	 	when 'LEFT', 'RIGHT', 'MOVE', 'REPORT'
	 		command = {:type => command_split[0]}
	 	else
	 		puts "#{command_split[0]} is an invalid command"
	 	end

	 	return command
	end

end