class Score < Bowling
	def initialize
		
	end

	def bowling_print
    self.bowling_print_lines
    self.jump
    (1..10).each {|turno| print "|%2s         |" % [turno] }
    print "\n"
    (0..9).each {|turno| print '|  %3s | %3s|' % [@rounds[turno][0], @rounds[turno][1]] }
    self.jump
    self.bowling_print_lines
    self.bowling_print_spaces
    (0..9).each {|turno| print '|    %3s    |' % [@points[turno]]}
    self.bowling_print_spaces('|', '_')
  end

  def bowling_print_lines(line = '-')
    (0..130).each {print line}
  end

  def bowling_print_spaces(v_line = '|', space = ' ')
    self.jump
    (0..9).each do
      print v_line
      (0..10).each { print space }
      print '|'
    end
    print "\n"
  end

  def jump
    print "\n"
  end
	
	
end