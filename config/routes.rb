Rails.application.routes.draw do
  resources :riddles
  resources :answers
  resources :questions
  resources :challenges
  resources :adventures
end
