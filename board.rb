require "./tile.rb"

class Board

  def initialize(size, bombs) #size is of the format: [dim1, dim2]
    @size = size
    @grid = Array.new(size[0]) { Array.new(size[1]) }
  end

  def populate(bombs)
    diffs = [[-1, -1], [-1, 0], [-1, 1], [0, -1]]
    @grid.each_with_index do |row, i|
      row.each_index do |j|
        is_bomb = Random.new.rand(1.0) < bomb_prob(bombs, i, j)
        if is_bomb
          bombs -= 1
        end
        current_tile = Tile.new(is_bomb)
        diffs.each do |curr_diff|
          if (i + curr_diff[0] >= 0) && (j + curr_diff[1] >= 0) && (j + curr_diff[1] < @size[1])
            #puts "I: #{i}\nJ: #{j}"
            @grid[i + curr_diff[0]][j + curr_diff[1]].add_neighbor(current_tile)
          end
        end
        row[j] = current_tile
      end
    end
  end

  def bomb_prob(bombs, i, j)
    total_squares = @size[0] * @size[1]
    populated_rows = i * @size[1]
    populated_spots = populated_rows + j
    remaining_spots = total_squares - populated_spots
    return bombs.to_f / remaining_spots
  end

  def tiles_remaining?
    @grid.each do |row|
      row.each do |tile|
        if !(tile.revealed) && !(tile.bombed)
          return true
        end
      end
    end
    false
  end

  def board_state
    spots = []
    @grid.each do |row|
      row.each do |tile|
        spots << tile.representation
      end
    end
    spots
  end

  def reveal(loc)
     @grid[loc[0]][loc[1]].reveal
  end

  def flag(loc)
    @grid[loc[0]][loc[1]].flag
  end

  def over
    @grid.each do |row|
      row.each do |tile|
        tile.reveal if tile.bombed
      end
    end
  end
end
