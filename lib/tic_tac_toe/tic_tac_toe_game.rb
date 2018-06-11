class TicTacToeGame
  attr_accessor :current_turn, :game_board, :size_board, :reset_board
  attr_reader :check_winner

  def initialize(size_board = 3)
    reset_board(size_board)
  end

  def board
    game_board.board
  end

  def reset_board(size_board = 3)
    @current_turn = 'x'
    @size_board = size_board
    @game_board = GameBoard.new(size_board)
    @check_winner = CheckWinner
  end

  def move(location)
    switch_turn if game_board.move(location-1, current_turn)
    board
  end

  def win?(turn = previous_turn)
    check_winner.new(size_board, board, turn).win?
  end

  def previous_turn
    current_turn == 'x' ? 'o' : 'x'
  end

  private
  def switch_turn
    @current_turn = current_turn == 'x' ? 'o' : 'x'
  end
end
