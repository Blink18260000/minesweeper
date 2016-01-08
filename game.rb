class Game
  def initialize(player)
    @player = player
    @size = player.get_size
    @bombs = player.get_bombs
    board = Board.new(@size, @bombs)
    @board = board.populate
  end

  def play
    @player.display
    # until !@board.tiles_remaining
    #   @player.display(@board.board_state, @size[0])
    #
    # end
  end
end

if __FILE__ == $PROGRAM_NAME
  theGame = Game.new(Player.new("Kevin"))
  winner = theGame.play
end
