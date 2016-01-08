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
    puts "Which spot should be revealed?"
    location = gets.chomp
    # if location == "F"
    while location.size == 0
      location = gets.chomp
    end
    ind0, ind1, ind2 = location.split(/,* */)
    if ind0 == "f"
      return [ind1.to_i, ind2.to_i, true]
    else
      return [ind0.to_i, ind1.to_i]
    end
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
