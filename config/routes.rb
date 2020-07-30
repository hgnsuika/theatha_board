Rails.application.routes.draw do
  root to: 'photos#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :users, only: [:index, :show, :new, :create]
  
  resources :users, only: [:index, :show, :new, :create] do
    
  member do
      get :posts
  end
  end

  resources :photos, except: [:index]
  resources :comments 


 end
