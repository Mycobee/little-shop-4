Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/login', to: 'sessions#new', as: :login

  resources :items, only:[:index] do
  end

  resources :merchants, only:[:index] do
  end

  resources :cart, only:[:index] do
  end

  resources :login, only:[:index] do
  end

  resources :users, only:[:new] do
  end

end
