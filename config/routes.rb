ActionController::Routing::Routes.draw do |map|
  map.resources :pages

  map.resources :members
  map.resources :entities

  # map.root :controller => "welcome"

  map.static ':permalink', :controller => 'pages', :action => 'show'
end