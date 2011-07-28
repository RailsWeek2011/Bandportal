Bandportal::Application.routes.draw do
  get "tenders/active" => "tenders#active", :as => "tenders_active"

  resources :candidatures

  resources :tenders

  resources :events

  resources :unregistered_users

  resources :groups

  root :to => "home#index"

  get "home/index"

  devise_for :users

  get "users/:id" => "users#show", :as => "user_profile"

  post "groups/selecttype" => "groups#selecttype", :as => "group_select_type"

  post "groups/:id/add_user" => "groups#add_user", :as => "add_user_to_group"
  post "groups/:id/add_unreg_user" => "groups#add_unreg_user", :as => "add_unreg_user_to_group"
  delete "groups/:id/remove_user/:user_type/:user_id" => "groups#remove_user", :as => "remove_user_from_group"

  get "events/:host_id/new" => "events#new", :as => "new_event_id"

  post "events/add_program_item" => "events#add_program_item", :as => "add_program_item"

  get "events/remove_program_item/:event_id/:artist_id" => "events#remove_program_item", :as => "remove_program_item"

  get "tenders/:event_id/new" => "tenders#new", :as => "new_tender_id"

  get "candidatures/:tender_id/new" => "candidatures#new", :as => "new_candidature_id"

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
