require_relative "lib/bowling"


game = Bowling.new
game.bowPrint
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
	game.bowPrint
end
pointE = game.rounds(9)
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
	game.bowPrint
end