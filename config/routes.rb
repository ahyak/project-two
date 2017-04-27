Rails.application.routes.draw do
  root 'users#index'
  resources :users

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get   '/signup' => 'users#new'
  delete '/logout' => 'sessions#destroy'
end

=begin
Prefix Verb         URI Pattern                 Controller#Action
login_path  GET	     /login		                  sessions#new
login_path  POST	   /login	         	          sessions#create
logout_path DELETE	/logout	                   	sessions#destroy
signup_path GET    /signup                      users#new
       root GET    /                            users#index
      users GET    /users(.:format)             users#index
            POST   /users(.:format)             users#create
   new_user GET    /users/new(.:format)         users#new
  edit_user GET    /users/:id/edit(.:format)    users#edit
       user GET    /users/:id(.:format)         users#show
            PATCH  /users/:id(.:format)         users#update
            PUT    /users/:id(.:format)         users#update
            DELETE /users/:id(.:format)         users#destroy
=end
