Rails.application.routes.draw do
  
  devise_for :users, only: []

  resources :riddles
  resources :answers
  resources :questions
  resources :challenges

  resources :login, only: [:create], controller: :sessions, defaults: {format: :json}

  resources :adventures, defaults: {format: :json} do
    resources :reviews, defaults: {format: :json}
  end

end
