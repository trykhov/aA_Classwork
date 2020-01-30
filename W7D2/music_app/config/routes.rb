Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:new, :create, :show]
  # need a :create route to post when the form from the :new page is submitted
  resources :sessions, only:[:new, :create, :destroy]
end
