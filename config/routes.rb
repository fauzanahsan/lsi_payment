LsiPayment::Application.routes.draw do
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
  root :to => 'orders#new'
  
  match 'confirm_payment' => 'veritrans#confirm_payment',      :via => :get
  
  match 'confirm'      => 'veritrans#confirm',      :via => :post # confirmation autosubmit to veritrans server
  match 'cancel_pay'   => 'veritrans#cancel_pay',   :via => :post # canceling transaction redirect back to merchant-web
  match 'notification' => 'veritrans#notification', :via => :post # server to server notification to merchant-web
  match 'finish'       => 'veritrans#finish',       :via => :post # successfull transaction redirect back to merchant-web
  match 'error'        => 'veritrans#error',        :via => :post # error transaction redirect back to merchant-web
  
  resources :orders, :only => ['index', 'show', 'edit', 'create']  do
    collection do
      post :confirm
    end
  end

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
