require "application_responder"

class ApplicationController < ActionController::Base
  before_action :size_board_default, :initialize_game

  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception

  def respond_modal_with(*args, &blk)
    options = args.extract_options!
    options[:responder] = ModalResponder
    respond_with *args, options, &blk
  end

  private
  def size_board_default
    Gon.global.size_board = 4
  end

  def initialize_game
    @game = TicTacToeGame.new(Gon.global.size_board)
  end
end
