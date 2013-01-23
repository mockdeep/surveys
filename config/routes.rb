Surveys::Application.routes.draw do
  root :to => 'surveys#index'

  resources :users, :only => [:create]
  resources :sessions, :only => [:create]
  resources :surveys, :only => [:new, :create]

  get '/signup',  :to => 'users#new', :as => 'signup'
  get '/signin', :to => 'sessions#new', :as => 'signin'
  delete '/signout', :to => 'sessions#destroy', :as => 'signout'
end
