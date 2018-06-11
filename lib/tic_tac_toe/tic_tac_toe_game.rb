class TicTacToeGame
  attr_accessor :current_turn, :game_board

  def initialize(size_board = 3)
    @current_turn = 'x'
    @game_board = GameBoard.new(size_board)
  end

  private
  def switch_turn
    @current_turn = current_turn == 'x' ? 'o' : 'x'
  end
end
