ActionController::Routing::Routes.draw do |map|
  map.resources :roles
  map.resources :promotions
  map.resources :availabilities
  map.resources :pages
  map.resources :events
  map.resources :posts
  map.resources :user_sessions
  map.resources :members
  map.resources :entities
  map.resources :event_types, :only => [:index]

  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"

  map.root :controller => "posts"
  map.static ':permalink', :controller => 'pages', :action => 'show'
end
