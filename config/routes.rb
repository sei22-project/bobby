Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users

  get 'categories', to: 'categories#index', as: 'categories'
  get 'categories/sort', to: 'categories#sort'
  get 'categories/:id', to: 'categories#show', as: 'category'

  get 'games/new', to: 'games#new', as: 'new_game'
  get 'games/:id', to: 'games#show'
  get 'games/:id/edit', to: 'games#edit'
  post 'games', to: 'games#create'
  put 'games/:id', to: 'games#update'
  delete 'games/:id', to: 'games#delete'

  get 'users/:id', to: 'users#show_profile'
  get 'users/:id/edit', to: 'users#edit'
  put 'users/:id', to: 'users#update'
  get 'dashboard', to: 'users#show_dashboard'

  get 'rooms/:id', to: 'rooms#show'

  post 'messages', to: 'messages#create'

  post 'requests', to: 'requests#create'
  put 'requests', to: 'requests#update', as: 'edit_request'
  delete 'requests', to: 'requests#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end