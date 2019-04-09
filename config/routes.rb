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
  get '/profile/edit', to: 'users#edit', as: :edit_profile
  patch '/profile', to: 'users#update', as: :update_profile

  post '/merchant/disable', to: 'admin/merchants#disable', as: :disable_merchant_status
  post '/merchant/enable', to: 'admin/merchants#enable', as: :enable_merchant_status

  # patch '/item/update', to: 'item#update', as: :item_update

  namespace :admin do
    resources :users, only: [:index, :show]
    resources :merchants, only: [:show, :index, :update]
  end

  resources :items, only:[:index, :show, :update, :destroy] do
  end

  namespace :merchant do
    get '/', to: 'dashboard#show', as: :dashboard
  end

  namespace :dashboard do
    resources :items, only:[:index]
    resources :orders, only: [:show]
  end
  # scope module: 'dashboard', as: 'dashboard' do
  #   resources :items, only:[:index]
  # end

  namespace :admin do
    get '/', to: 'dashboard#show', as: :dashboard
    # resources :items, # TODO
  end

  resources :merchants, only: [:index, :edit, :update] do
  end

  resources :users, only:[:new, :create] do
  end

  resources :carts, only: [:create, :show, :update]
end
  # get '/merchant/dashboard/:id', to:'merchant/dashboard#show'
