Rails.application.routes.draw do
  get 'home/Index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get 'categories', to: 'categories#index'
  get 'categories/:id', to: 'categories#show'
  get 'games/:id', to: 'games#show'
  post 'games', to: 'games#create'
  put 'games/:id', to: 'games#update'
  delete 'games/:id', to: 'games#delete'
  get 'users/:id', to: 'users#show'
  get 'users/:id/edit', to: 'users#edit'
  put 'users/:id', to: 'users#update'
end