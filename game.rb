class Game
  def initialize(win_checker)
    @board = [ [nil, nil, nil],[nil, nil, nil],[nil, nil, nil] ]
    @pieces = [:o, :x]
    @turn = 0
    @win_checker = win_checker
  end

  def display_board
    rows_as_string = @board.map { |row| row_to_string(row) }
    rows_as_string.join("\n_ _ _\n")
  end

  def new_game
    @board = [ [nil, nil, nil],[nil, nil, nil],[nil, nil, nil] ]
    @turn = 0
    @pieces.rotate!
    puts display_board
  end

  def place_piece(row, column)
    if out_of_range?(row, column)
      puts "Not in range...try again!"
      return
    elsif space_taken?(row, column)
      puts "Not available... try again!"
      return
    end
    @board[row][column] = current_piece
  end

  def turn(row, column)
    place_piece(row, column)
    puts display_board
    check_for_win
  end

  def display_turn
    puts "\n'#{current_piece}' to play:\n"
  end

  def check_for_win
    if @win_checker.has_won?(current_piece, @board)
      puts "\n'#{current_piece}' wins!\n"
      end_game
    elsif board_full?
      puts "\nIt's a draw!\n"
      end_game
    else
      @turn += 1
      display_turn
    end
  end

  def game_over?
    has_won?(:x) || has_won?(:o) || board_full?
  end

  def end_game
    puts "Play again..."
    new_game
  end

  private

    def row_to_string(row)
      row_symbols = row.map { |piece| piece || " "}
      row_symbols.join("|")
    end

    def out_of_range?(row, column)
      row > 2 || column > 2
    end

    def space_taken?(row, column)
      @board[row][column]
    end

    def board_full?
      @board.flatten.all?
    end

    def current_piece
      @pieces[@turn%2]
    end

end