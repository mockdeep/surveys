Surveys::Application.routes.draw do
  root :to => 'sessions#new'

  resources :users, :only => [:create]
  resources :sessions, :only => [:create]

  get '/signup',  :to => 'users#new', :as => 'signup'
  get '/signin', :to => 'sessions#new', :as => 'signin'
  delete '/signout', :to => 'sessions#destroy', :as => 'signout'
end
