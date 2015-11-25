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
    puts "New game:\n"
    puts display_board
  end

  def place_piece(row, column)
    if out_of_range?(row, column)
      puts "Not in range...try again!"
      return false
    elsif square_taken?(row, column)
      puts "Not available... try again!"
      return false
    else
      @board[row][column] = current_piece
    end
  end

  def turn(row, column)
    if place_piece(row, column)
      puts display_board
      check_for_win
    end
    display_turn
  end

  def display_turn
    puts "\n'#{current_piece}' to play:\n"
  end

  def check_for_win
    if @win_checker.has_won?(current_piece, @board)
      puts "\n'#{current_piece}' wins!\n"
      new_game
    elsif board_full?
      puts "\nIt's a draw!\n"
      new_game
    else
      @turn += 1
    end
  end

  def game_over?
    has_won?(:x) || has_won?(:o) || board_full?
  end

  private

    def row_to_string(row)
      row_symbols = row.map { |piece| piece || " "}
      row_symbols.join("|")
    end

    def out_of_range?(row, column)
      row > 2 || column > 2
    end

    def square_taken?(row, column)
      @board[row][column]
    end

    def board_full?
      @board.flatten.all?
    end

    def current_piece
      @pieces[@turn%2]
    end

end