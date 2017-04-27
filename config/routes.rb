Rails.application.routes.draw do

  root 'posts#index'
  resources :users
  resources :posts

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get   '/signup' => 'users#new'
  delete '/logout' => 'sessions#destroy'



end

=begin
Prefix Verb   URI Pattern               Controller#Action
  root GET    /                         users#index
 users GET    /users(.:format)          users#index
       POST   /users(.:format)          users#create
new_user GET    /users/new(.:format)      users#new
edit_user GET    /users/:id/edit(.:format) users#edit
  user GET    /users/:id(.:format)      users#show
       PATCH  /users/:id(.:format)      users#update
       PUT    /users/:id(.:format)      users#update
       DELETE /users/:id(.:format)      users#destroy
 posts GET    /posts(.:format)          posts#index
       POST   /posts(.:format)          posts#create
new_post GET    /posts/new(.:format)      posts#new
edit_post GET    /posts/:id/edit(.:format) posts#edit
  post GET    /posts/:id(.:format)      posts#show
       PATCH  /posts/:id(.:format)      posts#update
       PUT    /posts/:id(.:format)      posts#update
       DELETE /posts/:id(.:format)      posts#destroy
 login GET    /login(.:format)          sessions#new
       POST   /login(.:format)          sessions#create
signup GET    /signup(.:format)         users#new
logout DELETE /logout(.:format)         sessions#destroy
=end
