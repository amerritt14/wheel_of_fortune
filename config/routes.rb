Rails.application.routes.draw do
  resources :games
  resources :guesses
  resources :letters
  resources :rounds
  resources :puzzles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
