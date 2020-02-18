Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/show'
  devise_for :users
  root to: 'pages#home'

   resources :monuments, only: [:index, :create, :show, :new] do
     collection do
      get :search
     end
   end
   resources :monuments, only: [:show] do
    resources :bookings, only: [:new, :create, :show]
   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
