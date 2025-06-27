# Board class
class Board
  WINNERS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze

  attr_accessor :board_grid

  def initialize
    self.board_grid = [[1, 2, 3],
                       [4, 5, 6],
                       [7, 8, 9]]
  end

  def print_board(board_grid)
    puts "#######"
    board_grid.each do |row|
      puts "##{row[0]}##{row[1]}##{row[2]}#"
      puts "#######"
    end
  end

  # Player One always starts first, Turn can be found with 9-(turn) to see which player made the move.
  def update(turn, number)
    number = Integer(number)
    # [((number - 1.0) / 3).floor] => Calculates Row
    # [(number - 1) % 3]
    player_symbol = turn.even? ? "O" : "X"
    row, col = calculate_position(number)
    board_grid[row][col] = player_symbol
  end

  # Checks if the current board (after turn) contains a set
  def winner?(turn, grid)
    player_symbol = turn.even? ? "O" : "X"

    return true if row_winner?(grid, player_symbol)

    return true if col_winner?(grid, player_symbol)

    return true if diag_winner?(grid, player_symbol)

    false
  end

  private

  def calculate_position(number)
    row = ((number - 1.0) / 3).floor
    col = (number - 1) % 3
    [row, col]
  end

  def row_winner?(board_grid, player_symbol)
    board_grid.any? { |row| row.all? { |cell| cell == player_symbol } }
  end

  def col_winner?(board_grid, player_symbol)
    (0..2).any? { |col| board_grid.all? { |row| row[col] == player_symbol } }
  end

  def diag_winner?(board_grid, player_symbol)
    left_to_right = (0..2).all? { |i| board_grid[i][i] == player_symbol }
    right_to_left = (0..2).all? { |i| board_grid[i][2 - i] == player_symbol }
    right_to_left || left_to_right
  end
end

# #######
# #1#2#3#
# #######
# #4#5#6#
# #######
# #7#8#9#
# #######
