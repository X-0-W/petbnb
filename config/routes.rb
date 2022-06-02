Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pets, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create]
    collection do
      get :map
    end
  end
  resources :bookings, only: [:index, :edit, :update]
  get '/dashboard', to: 'users#show', as: 'dashboard'
end
