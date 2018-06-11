class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_default

  private
  def set_default
    @error = {}
  end
end
