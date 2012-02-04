MlclspApp::Application.routes.draw do

  resources :users

  root :to => 'pages#home'
  match '/produkte', :to => 'pages#produkte'
  match '/signup', :to => 'users#new'

end