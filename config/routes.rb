Rails.application.routes.draw do

  root 'sessions#index'

  # load loginreg page
  get '/loginreg'=> 'sessions#loginreg'

  # register or login process
  post '/register' => 'users#create'
  post '/login' => 'sessions#login'

  # load the events
  get '/events/:id' => 'events#main'
  get '/events/:id/new' => 'events#new'
  get '/events/:id/new2' => 'events#new2'

  # create an event
  post '/create' => 'events#create'

  # show the event
  get '/show/:id' => 'events#show'

  # edit the event
  get '/edit/:id' => 'events#edit'
  patch '/edit/:id' => 'events#update'

  # create item
  post '/items' => 'items#create'
  post '/guests' => 'attendees#add_guest'

  # update bringing item to party
  patch '/bring/:id' => 'items#bring'

  # RSVP to party
  post '/rsvp/:id' => 'users#going'

  # delete an event
  delete '/delete/:id' => 'events#delete'

  # logout
  get '/logout' => 'sessions#logout'

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
