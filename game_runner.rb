require "pry-byebug"
require_relative("game")

#create game
game = Game.new()

#place piece
game.turn(0,0)

#display board
game.display_board

#reset board
# game.new_game

#don't allow putting pieces out of range
game.turn(5,0)
game.turn(0,4)

#rotate the starting piece when resetting
#automatically reset when the board is full, and tell us it's a draw
#-----------------------
#automatically detect when someone has won, and notify
piece = :o
puts "checking if game is won horizontal... #{game.has_won?(piece)}. Expect it to be false."
game.turn(1,0)
game.turn(0,1)
game.turn(1,1)
game.turn(0,2)

# puts "checking if game is won horizontal... #{game.has_won?(piece)}. Expect it to be true."

# game.new_game

piece = :x
puts "checking if game is won vertical... #{game.has_won?(piece)}. Expect it to be false."
game.turn(0,0)
game.turn(0,1)
game.turn(1,0)
game.turn(0,2)
game.turn(2,0)

# puts "checking if game is won vertical... #{game.has_won?(piece)}. Expect it to be true."

# game.new_game

piece = :o
puts "checking if game is won diagonal... #{game.has_won?(piece)}. Expect it to be false."
game.turn(0,0)
game.turn(0,1)
game.turn(1,1)
game.turn(0,2)
binding.pry;""
game.turn(2,2)

# puts "checking if game is won diagonal... #{game.has_won?(piece)}. Expect it to be true."
