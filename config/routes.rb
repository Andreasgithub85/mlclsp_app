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
  match 'problem_solutions/optimize', :to => 'problem_solutions#optimize'
  match 'problem_solutions/read_production_inventory_quantities', :to => 'problem_solutions#read_production_inventory_quantities'
  match 'problem_solutions/read_and_show_ofv', :to => 'problem_solutions#read_and_show_ofv'
  match 'problem_solutions/show_production_quantities', :to => 'problem_solutions#show_production_quantities'
  match 'problem_solutions/show_inventory_quantities', :to => 'problem_solutions#show_inventory_quantities'
  match 'problem_solutions/delete_production_quantities', :to => 'problem_solutions#delete_production_quantities'
  match '/about', :to => 'pages#about'
end