require_relative "lib/bowling"
require_relative "lib/score"

game = Score.new
game.bow_print
while game.turn < 10
	puts "Primer tiro.. "
	tiro1 = gets.chomp
	puts "Segundo tiro.. "
	tiro2 = gets.chomp
	if !game.capture(tiro1, tiro2)
		puts "Datos incorrectos, vuelva a intentarlo"
		next
	end
	game.calculate
	system "clear"
	game.bow_print
end
pointE = game.rounds[9]
if (pointE[0] + pointE[1]) == 10
	tiro2 = 0
	puts "tiro extra.. "
	tiro1 = Integer(gets.chomp)
	if tiro1 == 10
		puts "Segundo tiro extra.. "
		tiro2 = gets.chomp
	end
	game.capture(tiro1, tiro2)
	game.calculate
	system "clear"
	game.bow_print
end