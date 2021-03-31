Rails.application.routes.draw do
  devise_for :users
  root to:  'items#index'
  resources :items
  resources :lists do
    collection do
      get :search
      get :result
    end
  end
  resources :analyses
end
