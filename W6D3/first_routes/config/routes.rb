Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'
  # post '/users', to: 'users#create'
  # get '/users/new', to: 'users#new'
  # patch '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'
  # resources :users
  resources :users, except:[:edit] do
    resources :artworks, only:[:index]
    resources :comments, only:[:create, :destroy, :index]
  end
  resources :artworks, only:[:index] do
    resources :comments, only:[:create, :destroy, :index]
  end
  resources :artwork_shares, only:[:create, :destroy]
  # resources :comments, only:[:create, :destroy, :index]
end
