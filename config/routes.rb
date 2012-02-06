MlclspApp::Application.routes.draw do

  get "sessions/new"

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]

  root :to => 'pages#home'
  match '/produkte', :to => 'pages#produkte'
  match '/signup', :to => 'users#new'
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

end