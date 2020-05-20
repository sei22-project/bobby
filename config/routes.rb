Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :user, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "signup" }

  get 'categories', to: 'categories#index', as: 'categories'
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
  delete 'requests', to: 'requests#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end