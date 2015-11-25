require "pry-byebug"
require_relative("game")
require_relative("win_checker")

#create game
win_checker_1 = WinChecker.new()
game = Game.new(win_checker_1)

binding.pry

#place piece
game.turn(0,0)

#display board
#game.display_board

#reset board
# game.new_game

#don't allow putting pieces out of range
# game.turn(5,0)
# game.turn(0,4)

#rotate the starting piece when resetting
#automatically reset when the board is full, and tell us it's a draw
# #automatically detect when someone has won, and notify
#-----------------------

##HOMEWORK
# Look over and re-implement any of the functionality we did in class

# Create a new class to do the win checking using a new method

# Keep a scoresheet for the number of wins for noughts and for crosses

# Create a computer player to play against