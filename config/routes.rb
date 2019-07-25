Rails.application.routes.draw do
  resources :players
  resources :games do
    resources :rounds
  end
  resources :guesses
  resources :letters
  resources :puzzles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
