#
#  Bowling class capture and calcule the punctuation in game
#
class Bowling
  attr_reader :rounds, :points, :turn

  def initialize
    # => poins contain array with puntuation in game
    @points = Array.new(10) { nil }
    
    # => rounds capture pins downs in all shots, it is matrix 10X2
    @rounds = Array.new(11) { Array.new(2) { nil } }

    # => turn is a turn played
    @turn = 0
  end

  def capture(primer_tiro, segundo_tiro)
    begin
      primer_tiro, segundo_tiro, bowl = Integer(primer_tiro), Integer(segundo_tiro), primer_tiro.to_i + segundo_tiro.to_i
    rescue
      return nil
    end

    return nil if (primer_tiro.negative? || segundo_tiro.negative? || segundo_tiro > 10 || primer_tiro > 10)
    return nil if (@turn!=10) && ((bowl).negative? || (bowl) > 10)

    @rounds[@turn] = [primer_tiro.to_i, segundo_tiro.to_i]
  end

  def calculate
    if @turn < 10
      @points[@turn] = @rounds[@turn].sum
    end
    is_strike
    is_spare

    @turn += 1
    @points
  end

  private 
  def is_strike
    last, two_last, last_bowling = @turn - 1, @turn - 2, @rounds[@turn][0]
    if (two_last) >= 0
      if (@rounds[last] == [10, 0]) && (@rounds[two_last] == [10, 0])
        @points[two_last] += last_bowling
        @points[last] += last_bowling
      end
    end
  end

  def is_spare
    last_turn, shoot, last_shoot, points_last, points_this = (@turn - 1), @rounds[@turn], @rounds[@turn-1], @points[@turn-1], @points[@turn]
    if last_turn >= 0
      if (last_shoot.sum) == 10
        points_last += (last_shoot == [10, 0]) ? shoot.sum : shoot[0]
      end
      if @turn < 10
        points_this += points_last
      end
    end
    @points[last_turn], @points[@turn] = points_last, points_this
  end
end
