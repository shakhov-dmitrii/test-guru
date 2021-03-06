Rails.application.routes.draw do
  devise_for :users, path: :gurus, path_names: {sign_in: :login, sign_out: :logout}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tests#index'

  # get :signup, to: 'users#new'
  # get :login, to: 'sessions#new'
  # get :logout, to: 'sessions#destroy'

  # resources :users, only: :create
  # resources :sessions, only: :create

  get :feedback, to: 'feedback#index'
  post :feedback, to: 'feedback#create'

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: [:show, :update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    root 'tests#index'
    
    resources :gists, only: :index
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
