class WinChecker

  def has_won?(symbol, board)
    horizontal_line?(symbol, board) || vertical_line?(symbol, board) || diagonal_line?(symbol, board)
  end

  def horizontal_line?(symbol, board)
      board.any? { |row| row_has_winning_line(row, symbol) }
  end

  def vertical_line?(symbol, board)
    transposed_board = board.transpose
    horizontal_line?(symbol, transposed_board)
  end

  def diagonal_line?(symbol, board)
    middle_piece = board[1][1]
    return false if middle_piece != symbol
    top_left_and_bottom_right = board[0][0]==symbol && board[2][2] == symbol
    top_right_and_bottom_left = board[0][2]==symbol && board[2][0] == symbol
    top_right_and_bottom_left || top_left_and_bottom_right
  end

  def row_has_winning_line(row, symbol)
    row.all? { |square| square == symbol }
  end

end