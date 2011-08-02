Subtools3::Application.routes.draw do  
  netzke

  resources :requests
  resources :requests_positions

  resources :comments

  resources :addresses

  resources :searches

  resources :categories

  resources :profils

  resources :principals
  resources :agents, :has_many => :profils

  devise_for :users
  resources :users, :has_one => :principal
  resources :users, :has_one => :agent

  resources :events
  get "calendar/index"

  get "pages/home"
  get "pages/about"
  
  match "/requests/create" => "requests#create"
  match "/requests" => "requests#show"
  
  match "/principals" => "principals#show"
  #match "/principals/:id/new" => "principals#new"
  match "/principals/:id" => "principals#show"
  match "/principals/:id/edit" => "principals#edit"
  match "/principals/:id/password" => "principals#password"
  match "/principals/password" => "principals#password"

  match "/agents" => "agents#show"
  match "/agents/new" => "agents#new"
  #match "/agents/:id/new" => "agents#new"
  match "/agents/:id" => "agents#show"
  match "/agents/:id/edit" => "agents#edit"
  match "/agents/:id/password" => "agents#password"
  match "/agents/password" => "agents#password"
  
  match "/comments/add_comment" => "comments#add_comment"

  match "/profils" => "profils#show"
  match "/profils/:id" => "profils#show"
  match "/profils/:id/edit" => "profils#edit"
  
  match "/search" => "searches#new"
  match "/searches/:id" => "searches#show"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "pages#home"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
