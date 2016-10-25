Rails.application.routes.draw do
  root 'session#new'
  # root 'users#index'
  get "/users/edit" => 'users#edit', :as => "edit_user"
  resources :users, :except => [:edit]
  get '/login' => 'session#new', :as => "login"
  post '/login' => 'session#create'
  delete '/logout' => 'session#destroy', :as => "logout"
  get 'recipes/search' => 'recipes#search'
  resources :recipes
end
