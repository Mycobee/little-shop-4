Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'


  get '/logout', to: 'sessions#destroy'
  # get '/admin/users', to: 'admins#index'
  #
  # get '/admin/user', to: 'user#show'
  # resources :admin_users do
  #   resources :users, only: [:index, :show]

  get '/profile', to: 'users#show', as: :profile

  namespace :admin do
    resources :users, only: [:index, :show]
  end

  resources :items, only:[:index, :show] do
  end

  namespace :merchant do
    get '/', to: 'dashboard#show', as: :dashboard
    # resources :items, # TODO
  end

  namespace :admin do
    get '/', to: 'dashboard#show', as: :dashboard
    # resources :items, # TODO
  end

  resources :merchants, only:[:index] do
  end

  resources :cart, only: [:index, :show] do
  end

  resources :users, only:[:new, :create] do
  end

end
  # get '/merchant/dashboard/:id', to:'merchant/dashboard#show'
