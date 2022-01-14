Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'infos',  to: 'users/registrations#new_info'
    post 'infos', to: 'users/registrations#create_info'
  end
  root to: "items#index"
  resources :users, only: :index
  resources :items do
    resources :orders
  end
end
