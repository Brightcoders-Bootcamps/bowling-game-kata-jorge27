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
      if (@rounds[@turn - 1] == [10, 0]) && (@rounds[@turn-2] == [10, 0])
        @points[@turn - 2] += @rounds[@turn][0]
        @points[@turn - 1] += @rounds[@turn][0]
      end
    end
    if (@turn - 1) >= 0
      if (@rounds[@turn - 1][0] + @rounds[@turn - 1][1]) == 10
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
    print "--------------------------------------------------------------------------------\n"
    print "| #{@rounds[0][0]} | #{@rounds[0][1]} | #{@rounds[1][0]}  | #{@rounds[1][1]} | "
    print "#{@rounds[2][0]}  | #{@rounds[2][1]} | #{@rounds[3][0]}  | #{@rounds[3][1]} | "
    print "#{@rounds[4][0]}  | #{@rounds[4][1]} | #{@rounds[5][0]}  | #{@rounds[5][1]} | "
    print "#{@rounds[6][0]}  | #{@rounds[6][1]} | #{@rounds[7][0]}  | #{@rounds[7][1]} | "
    print "#{@rounds[8][0]}  | #{@rounds[8][1]} | #{@rounds[9][0]}  | #{@rounds[9][1]} |"
    print "#{@rounds[10][0]}|#{@rounds[10][0]} |\n"
    print "|___|__|___|__|___|__|___|__|___|__|___|__|___|__|___|__|___|__|___|__|___|__| |\n"
    print "|      |      |      |      |      |      |      |      |      |      |      | |\n"
    print "|      |      |      |      |      |      |      |      |      |      |      | |\n"
    print "|  #{@points[0]}    |  #{@points[1]}    |  #{@points[2]}    |  #{@points[3]}    |  "
    print "#{@points[4]}    |  #{@points[5]}    |  #{@points[6]}    |  #{@points[7]}    |  "
    print "#{@points[8]}    |  #{@points[9]}    |      | |\n"
    print "|      |      |      |      |      |      |      |      |      |      |      | |\n"
    print "--------------------------------------------------------------------------------\n"
    
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