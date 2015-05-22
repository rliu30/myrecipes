Rails.application.routes.draw do
  
  root 'pages#home'

  get '/home', to: 'pages#home'
  
  resources :recipes do
    resources :reviews, except: [:show, :index]
  	member do
  		post 'like'
  	end
  end

  resources :chefs, except: [:new, :destroy]
  resources :styles, only: [:new, :create, :show]
  resources :ingredients, only: [:new, :create, :show]
  
   get '/register', to: 'chefs#new'

   get '/login', to: 'logins#new'
   get '/logout', to: 'logins#destroy'
   post '/login', to: 'logins#create'

end
