Rails.application.routes.draw do
  root to: 'game#show'

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :game
end
