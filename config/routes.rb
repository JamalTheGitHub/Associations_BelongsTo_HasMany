Rails.application.routes.draw do
  get 'home/index'
  get '/signup', to: 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  root 'home#index'
end
