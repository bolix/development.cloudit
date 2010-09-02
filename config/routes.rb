ActionController::Routing::Routes.draw do |map|



  map.connect '/logout', :controller => 'UserSessions', :action => 'destroy'
  map.connect '/profile/edit', :controller => 'Users', :action => 'edit'
  map.connect '/profile/update', :controller => 'Users', :action => 'update'
  
  map.resource :user_session, :only => [:new, :create, :destroy]
  map.resource :user
  map.resources :articles, :has_many => :votes
  map.resources :categories
  map.resources :votes
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  map.root :controller => :articles, :action => :index
end
