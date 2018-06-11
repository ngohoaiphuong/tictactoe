class GameController < ApplicationController
  def show
    # GameConfig::GAME.reset_board(GameConfig::GAME.size_board)
    Gon.global.size_board = GameConfig::GAME.size_board
    Gon.global.current_turn = GameConfig::GAME.current_turn
  end

  def new
    GameConfig::GAME.reset_board(4)
    Gon.global.current_turn = GameConfig::GAME.current_turn
    p GameConfig::GAME
    redirect_to root_path
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
