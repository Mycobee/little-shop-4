Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  post '/item/fulfill', to: 'dashboard/items#fulfill', as: :fullfill_item

  get '/profile', to: 'users#show', as: :profile
  get '/profile/edit', to: 'users#edit', as: :edit_profile
  get '/profile/orders', to: 'profile/orders#index', as: :profile_orders

  patch '/profile', to: 'users#update', as: :update_profile

  post '/merchant/disable', to: 'admin/merchants#disable', as: :disable_merchant_status
  post '/merchant/enable', to: 'admin/merchants#enable', as: :enable_merchant_status

  post '/item/disable', to: 'dashboard/items#disable', as: :disable_item_status
  post '/item/enable', to: 'dashboard/items#enable', as: :enable_item_status

  namespace :admin do
    resources :users, only: [:index, :show, :update]
    resources :merchants, only: [:show, :index, :update]
    get '/', to: 'dashboard#show', as: :dashboard
  end

  resources :items, only:[:index, :show, :update, :destroy] do
  end

  namespace :dashboard do
    resources :items, only:[:index, :new, :edit, :destroy, :create]
    resources :orders, only: [:show]
    get '/', to: 'dashboard#show'
  end

  resources :merchants, only: [:index, :edit, :update] do
  end

  resources :users, only:[:new, :create] do
  end

  resources :carts, only: [:create, :show, :update]
end
