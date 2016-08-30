Rails.application.routes.draw do
  #
  # get 'recipe/index'
  #
  # get 'recipe/new'
  #
  # get 'recipe/create'
  #
  # get 'recipe/edit'
  #
  # get 'recipe/update'
  #
  # get 'recipe/deastroy'

  # get 'users/index'
  #
  # get 'users/show'
  #
  # get 'users/new'
  #
  # get 'users/create'
  #
  # get 'users/edit'
  #
  # get 'users/update'
  #
  # get 'users/destroy'
  #
  # root "users#index"
  get "/users/edit" => 'users#edit', :as => "edit_user"
  resources :users, :except => [:edit]

  get '/login' => 'session#new', :as => "login"
  post '/login' => 'session#create'
  delete '/logout' => 'session#destroy', :as => "logout"

  resources :recipes
#
#   get '/recipe' => 'recipes#index'
#   get '/recipe/new' => 'recipes#new'
#   post '/recipe' => 'recipes#create'
#   get '/recipe/:id/edit' => 'recipes#edit'
#   post '/recipe/:id' => 'recipes#update'
# #   delete '/recipe/:id/delete' => 'recipe#destroy'
#   get 'recipe/:id' => 'recipe#show'
# #   root :to => 'pages#home'
#   get '/login' => 'session#new'         # This will be our sign-in page.
# post '/login' => 'session#create'     # This will be the path to which the sign-in form is posted
# delete '/login' => 'session#destroy'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
