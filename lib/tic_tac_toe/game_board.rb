class GameBoard
  attr_accessor :board

  def initialize(size_board = 3)
    @board = Array.new(size_board*size_board, '-')
  end

  def move(location, turn)
    if board[location] == '-'
      board[location] = turn
      location
    else
      nil
    end
  end

  def remaining_indices
    board.each_index.select { |ind| board[ind] == '-' }
  end

  def remaining_indices_count
    remaining_indices.count
  end
end
