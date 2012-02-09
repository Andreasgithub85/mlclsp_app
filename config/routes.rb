MlclspApp::Application.routes.draw do

  resources :resource_periods

  resources :periods

  resources :follower_products

  resources :followers
  resources :resources
  resources :products
  resources :problem_solutions
  resources :demands
  resources :users
  resources :sessions, :only => [:new, :create, :destroy]

  root :to => 'pages#home'

  match '/signup', :to => 'users#new'
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

end