Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users

  get 'categories', to: 'categories#index', as: 'categories'
  get 'categories/:id', to: 'categories#show', as: 'category'

  get 'games/:id', to: 'games#show'
  get 'games/new', to: 'games#new'
  get 'games/:id/edit', to: 'games#edit'
  post 'games', to: 'games#create'
  put 'games/:id', to: 'games#update'
  delete 'games/:id', to: 'games#delete'

  get 'users/:id', to: 'users#show'
  get 'users/:id/edit', to: 'users#edit'
  put 'users/:id', to: 'users#update'

  get 'rooms/:id', to: 'rooms#show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end