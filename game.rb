class Game
  def initialize
    @board = [ [nil, nil, nil],[nil, nil, nil],[nil, nil, nil] ]
    @pieces = [:o, :x]
    @turn = 0
  end

  def current_piece
    @pieces[@turn%2]
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
    @turn += 1
    unless game_over?
      display_turn
    end
  end

  def display_turn
    puts "\n'#{current_piece}' to play:\n"
  end

  def check_for_win
    if has_won?(current_piece)
      puts "\n'#{current_piece}' wins!\n"
      end_game
    elsif board_full?
      puts "\nIt's a draw!\n"
      end_game
    end
  end

  def game_over?
    has_won?(:x) || has_won?(:o) || board_full?
  end

  def end_game
    puts "Play again..."
    new_game
  end

  def has_won?(symbol)
    horizontal_line?(symbol, @board) || vertical_line?(symbol) || diagonal_line?(symbol)
  end

  def x_wins?
    has_won?(:x)
  end

  def o_wins?
    has_won?(:o)
  end

  def horizontal_line?(symbol, board)
      board.any? { |row| row_has_winning_line(row, symbol) }
  end

  def vertical_line?(symbol)
    transposed_board = @board.transpose
    horizontal_line?(symbol, transposed_board)
  end

  def diagonal_line?(symbol)
    middle_piece = @board[1][1]
    return false if middle_piece != symbol
    top_left_and_bottom_right = @board[0][0]==symbol && @board[2][2] == symbol
    top_right_and_bottom_left = @board[0][2]==symbol && @board[2][0] == symbol
    top_right_and_bottom_left || top_left_and_bottom_right
  end

  def row_has_winning_line(row, symbol)
    row.all? { |square| square == symbol }
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

end