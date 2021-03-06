VeterinaryClinic::Application.routes.draw do

  get "pages/home"

  get "pages/contact"

  get "pages/servicios"

  get "pages/about"

  get "pages/noticias"

  get "pages/clasificados"
  
  


  
 # resources :application do 
 #   get 'error', :on => :member 
 # end 

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
  # root :to => "welcome#index"
	root :to => "pages#home"
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  resources :consultas do 
    get 'search', :on => :collection
  end
  resources :animals do
     get 'search', :on => :collection
  end 
  resources :roles
  resources :clients  do
     get 'search', :on => :collection
  end 
  resources :breeds  do
     get 'search', :on => :collection
  end 
  resources :species  do
     get 'search', :on => :collection
  end 
  resources :doctors  do
     get 'search', :on => :collection
  end 
  resources :horaries  do
     get 'search', :on => :collection
  end 
  resources :meetings  do
     get 'empty', :on => :collection
  end 

  resources :type_consults
  resources :roles_users
  devise_for :users
  resources :users do
    get 'correo', :on=>:collection
  end

  match '*a', :to => 'error#routing'
end
