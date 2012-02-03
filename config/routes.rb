MlclspApp::Application.routes.draw do

  get "users/new"

  root :to => 'pages#home'
  match '/produkte', :to => 'pages#produkte'
  match '/signup', :to => 'users#new'

end