Rails.application.routes.draw do


  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'dashboard#dashboard'

   resources :monuments, only: [:index, :create, :show, :new] do
     collection do
      get :search
     end
   end

   resources :monuments, only: [:show] do
    resources :bookings, only: [:new, :create, :show]
    resources :reviews, only: [:create, :update]
  end

  resources :reviews, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
