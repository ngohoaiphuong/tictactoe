Rails.application.routes.draw do
  root to: 'game#new'

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :game, only: [:new, :create, :show] do
    post 'update_game_board', to: 'game#update_game_board', as: :update_game_board
    collection do
    end
  end
end
