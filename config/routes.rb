Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  resources :items, only:[:index] do
  end

  resources :merchants, only:[:index] do
  end

  resources :cart, only:[:index] do
  end

  resources :cart, only:[:index] do
  end

end
