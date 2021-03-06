Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  root to:  'items#index'

  resources :items, except: :destroy

  resources :lists, except: [:show, :edit, :update, :destroy] do
    collection do
      get :search
      get :result
    end
  end

  resources :analyses, except: :destroy do
    collection do
      post :generatepdf
    end
  end
end
