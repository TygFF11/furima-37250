Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'infos',  to: 'users/registrations#new_info'
    post 'infos', to: 'users/registrations#create_info'
  end
  root to: "items#index"
  resources :items do
    resources :orders
  end
end
