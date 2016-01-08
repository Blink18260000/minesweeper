require "./board.rb"
require "./player.rb"
require "byebug"

class Game
  def initialize(player)
    @player = player
    @size = player.get_size

    @bombs = player.get_bombs
    @board = Board.new(@size, @bombs)
    @board.populate(@bombs)
  end

  def play
    # @player.display(@board.board_state, @size[0])
    while @board.tiles_remaining?
      @player.display(@board.board_state, @size[0])
      print "\n"
      loc = @player.get_input
      if @board.reveal(loc)
        puts "you lose"
        break
      end


    end
  end
end

if __FILE__ == $PROGRAM_NAME
  theGame = Game.new(Player.new("Kevin"))
  winner = theGame.play
end
