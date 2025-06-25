# Board class
class Board
  WINNERS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze

  attr_accessor :board_grid

  def initialize
    self.board_grid = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  # Player One always starts first, Turn can be found with 9-(turn) to see which player made the move.
  def update(turn, number)
    if turn.even?
      # [((number - 1.0) / 3).floor] => Calculates Row
      # [(number - 1) % 3]
      board_grid[((number - 1.0) / 3).floor][(number - 1) % 3] = "X"
    elsif turn.odd?
      board_grid[((number - 1.0) / 3).floor][(number - 1) % 3] = "O"
    end
  end
end

# #######
# #1#2#3#
# #######
# #4#5#6#
# #######
# #7#8#9#
# #######
