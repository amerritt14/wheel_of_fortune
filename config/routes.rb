Rails.application.routes.draw do
  resources :guesses
  resources :letters
  resources :games
  resources :puzzles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
