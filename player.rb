class Player

  def initialize(name)
    @name = name
  end

  def display(board_state, width)
    board_state.each_with_index do |spot, i|
      print "/n" if i>0 && i % width ==0
      print spot
    end
  end

  def get_input

  end
end
