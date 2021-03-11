Rails.application.routes.draw do
  get 'lists/index'
  devise_for :users
  root to:  'items#index'
  resources :items
end
