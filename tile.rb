class Tile
attr_reader :bombed, :flagged, :revealed, :representation
attr_accessor :neighbors

  def initialize(bombed)
    @bombed = bombed
    @flagged = false
    @revealed = false
    @representation = "*"
    @neighbors = []
  end

  def add_neighbor(other_tile)
    @neighbors << other_tile
    other_tile.neighbors << self
  end

  def reveal
    if @flagged
      @flagged = false
      @representation = "*"
      return false
    end
    @revealed = true
    if @bombed
      @representation = "O"
      return true
    end
    neighbor_bombs = neighbor_bomb_count
    if neighbor_bombs == 0
      @representation = "_"
      @neighbors.each do |some_tile|
        some_tile.reveal unless some_tile.revealed
      end
    else
      @representation = neighbor_bombs.to_s
    end
    false
  end

  def flag
    @flagged = !@flagged
    @representation == "F" ? @representation = "*" : @representation = "F"
  end


  def neighbor_bomb_count
    count = 0
    @neighbors.each do |some_tile|
      count += 1 if some_tile.bombed
    end
    count
  end

end
