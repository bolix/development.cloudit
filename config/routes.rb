ActionController::Routing::Routes.draw do |map|

  map.resource :user_session, :only => [:new, :create, :destroy]
  map.resource :user
  map.resources :articles, :has_many => :votes
  map.resources :categories
  map.resources :votes
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  map.root :controller => :users, :action => :index
end
