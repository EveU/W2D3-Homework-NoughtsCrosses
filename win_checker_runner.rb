require_relative("win_checker")

win_checker = WinChecker.new()
symbol = :o

empty_board = [ [nil, nil, nil],[nil, nil, nil],[nil, nil, nil] ]
puts "Check that empty board does not win: #{win_checker.has_won?(symbol, empty_board)}. Expect false." 

board_with_horizontal = [ [:o, :o, :o],[nil, nil, nil],[nil, nil, nil] ]
puts "Check that horizontal line wins: #{win_checker.has_won?(symbol, board_with_horizontal)}. Expect true."

board_with_vertical = [ [:o, nil, nil],[:o, nil, nil],[:o, nil, nil] ]
puts "Check that vertical line wins: #{win_checker.has_won?(symbol, board_with_vertical)}. Expect true."

board_with_diagonal = [ [:o, nil, :o],[nil, :o, nil],[nil, nil, :o] ]
puts "Check that diagonal line wins: #{win_checker.has_won?(symbol, board_with_diagonal)}. Expect true."