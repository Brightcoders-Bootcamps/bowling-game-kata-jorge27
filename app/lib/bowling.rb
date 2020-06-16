class Bowling
  def initialize
    # => poins contain array with puntuation in game
    @points = Array.new(10) { nil }
    
    # => rounds capture pins downs in all shots, it is matrix 10X2
    @rounds = Array.new(11) { Array.new(2) { nil } }

    # => turn is a turn played
    @turn = 0
  end

  def capture(x, y)
    begin
      x = Integer(x)
      y = Integer(y)
    rescue
      return nil
    end
    

    if x.negative? || y.negative? || x > 10 || x > 10
      return nil
    end

    if (@turn!=10) && ((x + y).negative? || (x + y) > 10)
      return nil
    end

    @rounds[@turn] = [x, y]
  end

  def calculate
    if @turn < 10
      @points[@turn] = @rounds[@turn][0]+@rounds[@turn][1]
    end
    if (@turn - 2) >= 0
      if String(@rounds[@turn - 1] == [10, 0]) && String(@rounds[@turn-2] == [10, 0])
        @points[@turn - 2] += @rounds[@turn][0]
        @points[@turn - 1] += @rounds[@turn][0]
      end
    end
    if (@turn - 1) >= 0
      if String(@rounds[@turn - 1][0] + @rounds[@turn - 1][1]) == 10
        @points[@turn - 1] += @rounds[@turn][0]
        if @rounds[@turn - 1] == [10, 0]
          @points[@turn - 1] += @rounds[@turn][1]
        end
      end
      if @turn < 10
        @points[@turn] += @points[@turn - 1]
      end
    end

    @turn += 1
    @points
  end

  def bowPrint
    for i in 0..130
      print "-"
    end
    print "\n"
    for i in 1..10
      print "|%2s         |" % [i]
    end
    print "\n"
    for i in 0..9
      print "|  %3s | %3s|" % [@rounds[i][0], @rounds[i][1]]
    end
    print "\n"
    for i in 0..130
      print "-"
    end
    print "\n"
    for i in 0..9
      print "|"
      for j in 0..10
        print " "
      end
      print "|"
    end
    print "\n"
    for i in 1..10
      print "|    %3s    |" % [@points[i-1]]
    end
    print "\n"
    for i in 0..9
      print "|"
      for j in 0..10
        print " "
      end
      print "|"
    end
    print "\n"
  end

  def turn
    @turn
  end

  def rounds(num)
    @rounds[num]
  end
  
  @points
  @rounds
  @turn
end
