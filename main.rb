require_relative "lib/board"
require_relative "lib/player"

module Game
  # Game class
  class Game
    def initialize
      puts "Player One, you start with X's! Player Two you're after that with O's!"
    end

    # Play the game
    def play
      board = Board.new
      puts board.board_grid
      (1...10).each do |i|
      end
    end
  end
end

game = Game::Game.new
game.play
