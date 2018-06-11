class GameController < ApplicationController
  respond_to :html, :json

  def show
    GameConfig::GAME.reset_board(Gon.global.size_board)
    Gon.global.current_turn = GameConfig::GAME.current_turn
  end

  def new
    Gon.global.size_board = GameConfig::GAME.size_board
    Gon.global.current_turn = GameConfig::GAME.current_turn
  end

  def create
    @error = {}
    @error[:player1] = 'missing' unless params[:anything][:player1].present?
    @error[:player2] = 'missing' unless params[:anything][:player2].present?
    @error[:size_board] = {}
    @error[:size_board][:missing] = 'missing' unless params[:anything][:size_board].present?

    if params[:anything][:size_board].present? && params[:anything][:size_board][/\d/].nil?
      @error[:size_board][:format] = 'wrong'
    end

    @error.except!(:size_board) if @error[:size_board].blank?
    return render :new if @error.present?

    Gon.global.size_board = params[:anything][:size_board].to_i
    Gon.global.player1 = params[:anything][:player1]
    Gon.global.player2 = params[:anything][:player2]

    redirect_to game_path(0)
  end

  def update_game_board
    GameConfig::GAME.move(params[:game_id].to_i)
    Gon.global.current_turn = GameConfig::GAME.current_turn
    render json: {
      win: GameConfig::GAME.win?,
      previous_turn: GameConfig::GAME.previous_turn,
      next_turn: Gon.global.current_turn
    }

    # if GameConfig::GAME.win?
    #   return render json: {
    #     win: true,
    #     turn: GameConfig::GAME.current_turn
    #   }
    # else
    #   GameConfig::GAME.move(params[:game_id].to_i)
    #   Gon.global.current_turn = GameConfig::GAME.current_turn
    #   if GameConfig::GAME.win?(GameConfig::GAME.current_turn)
    #     return render json: {
    #       win: true,
    #       turn: GameConfig::GAME.current_turn
    #     }
    #   end
    # end
  end
end
