PatrioticFinger::Application.routes.draw do
  match 'rank/users.:format',
    :method => :get, :action => 'users', :controller => 'rank'
  match 'rank/countries.:format',
    :method => :get, :action => 'countries', :controller => 'rank'
  match 'rank/countryusers/:user_id.:format',
    :method => :get, :action => 'countryusers', :controller => 'rank'
  
  match 'users/new/name=:name&country_id=:country_id&device_id=:device_id.:format',
    :method => :post, :action => 'create', :controller => 'users'
  match 'users/login/:device_id.:format',
    :method => :get, :action => 'login', :controller => 'users'
  match 'users/update/user_id=:id&country_id=:country_id.:format',
    :method => :put, :action => 'update', :controller => 'users'
  match 'users/delete/:id.:format',
    :method => :delete, :action => 'destroy', :controller => 'users'
    
  match 'countries/point/value=:value&user_id=:user_id&country_id=:country_id.:format',
    :method => :put, :action => 'point', :controller => 'countries'
  match 'countries/all.:format',
    :method => :get, :action => 'index', :controller => 'countries'
  match 'countries/reset/this1sfltpt.:format',
    :method => :post, :action => 'reset', :controller => 'countries'
  match 'countries/flag/:country_id.:format',
    :method => :get, :action => 'flag', :controller => 'countries'
    
  resources :countries

  resources :users

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
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
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
  #       get :recent, :on => :collection
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
