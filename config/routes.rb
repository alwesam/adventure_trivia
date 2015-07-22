Rails.application.routes.draw do
  #resources :reviews, defaults: {format: :json}
  resources :riddles
  resources :answers
  resources :questions
  resources :challenges

  resources :adventures, defaults: {format: :json} do
    resources :reviews, defaults: {format: :json}
   #resources :challenges, defaults: {format: :json}
  end
end
