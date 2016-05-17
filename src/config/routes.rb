Rails.application.routes.draw do
  resources :reservations
  resources :tokens
  resources :trainers
  resources :customers
  resources :companies
  resources :users


  controller :login do
    post 'login/login' => :login, as: 'login'
    post 'login/dupEmail' => :dup_email, as: 'dupEmail'
    post 'login/updatePassword' => :update_password, as: 'updatePassword'
  end

  controller :reservations do
    # date format = 'yyyy-mm-dd'
    get 'reservations/customer/date/:date' => :customer_list_date, as: 'customerListByDate'
    get 'reservations/customer/week/:date' => :customer_list_week, as: 'customerListByWeek'
    get 'reservations/customer/month/:year/:month/' => :customer_list_month, as: 'customerListByMonth'
    post 'reservations/add' => :add, as: 'addReservation'

    get 'reservations/trainer/date/:date' => :trainer_list_date, as: 'trainerListByDate'
    get 'reservations/trainer/week/:date' => :trainer_list_week, as: 'trainerListByWeek'
    get 'reservations/trainer/month/:year/:month/' => :trainer_list_month, as: 'trainerListByMonth'

  end

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
