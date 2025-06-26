require_relative "lib/board"
require_relative "lib/player"

module Game
  # Game class
  class Game
    def initialize
      puts "Lets play Tic-Tac-Toe"
    end

    # Play the game
    def play_game
      board = Board.new
      puts board.board_grid
      (1...10).each do |i|
        placement = play_turn(i)
        board.update(i, placement)
        puts board.board_grid
      end
    end

    def play_turn(turn = 0)
      placement = 0
      if turn.odd?
        print "Player One, you're up with X's! Pick 1-9 or whatever is left!: "
        placement = gets.chomp
      elsif turn.even? && turn != 0
        print "Player Two, you're up with O's! Pick 1-9 or whatever is left!: "
        placement = gets.chomp
      end
      placement
    end
  end
end

game = Game::Game.new
game.play_game
