class Player

  def initialize(name)
    @name = name
  end

  def display(board_state, width)
    board_state.each_with_index do |spot, i|
      print "\n" if i>0 && i % width ==0
      print spot
    end
  end

  def get_input

  end

  def get_size
    puts "How big do you want the board to be?"
    size_string = gets.chomp
    if size_string.size == 0
      return [9, 9]
    end
    size0, size1 = size_string.split(/, */)
    size = [size0.to_i, size1.to_i]
  end

  def get_bombs
    puts "How many bombs?"
    bomb_string = gets.chomp
    if bomb_string.size == 0
      return 15
    end
    bomb_string.to_i
  end
end
