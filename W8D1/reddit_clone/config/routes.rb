Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, only:[:create, :new, :destroy]
  resources :users do 
    resources :subs, only:[:edit, :update]
    resources :posts, only:[:edit, :update]
  end
  resources :subs, except:[:edit, :update]
  resources :posts, except:[:index, :edit, :update]
end
