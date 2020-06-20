#
# Score print the punctuation board
#
class Score < Bowling
	def bow_print
		print_lines
    (1..10).each {|turno| print "|%2s         |" % [turno] }
    print "\n"
    (0..9).each {|turno| print '|  %3s | %3s|' % [@rounds[turno][0], @rounds[turno][1]] }
    print_lines
    bowling_print_spaces
    (0..9).each {|turno| print '|    %3s    |' % [@points[turno]]}
    puts ''
    bowling_print_spaces('|', '_')
	end

  private
  def bowling_print_spaces(v_line = '|', space = ' ')
    10.times{ print v_line + (space * 11) + v_line }
    print "\n"
  end

  def print_lines
    print "\n"
    puts '-' * 130
  end
end