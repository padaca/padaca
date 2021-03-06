Rails.application.routes.draw do

  resources :nachrichts
  devise_for :accounts do
    get '/accounts/sign_out' => 'devise/sessions#destroy'
  end

  devise_scope :user do
    authenticated do
      root 'fahrts#search', as: :authenticated_root
    end
  
    unauthenticated do
      root :to => redirect("/accounts/sign_in")
    end
  end

  post "/deactivate", to: "accounts#deactivate"
  post "/activate", to: "accounts#activate"

  get "/impressum", to: "padacar#impressum"

  get '/fahrts/search'
  post '/fahrts/search'

  get '/fahrts/mitfahrts'

  get '/fahrts/gespeichert', to: 'fahrts#marked'
  get '/fahrts/ungespeichert', to: 'fahrts#unmarked'

  get '/mitfahrers/self'

  resources :mitfahrers do
    post :bestaetigen, to: 'mitfahrers#confirm'
    delete :bestaetigen, to: 'mitfahrers#cancel'
  end

  resources :fahrts do
      post :speichern, to: 'fahrts#mark'
      delete :speichern, to: 'fahrts#unmark'

      post :mitfahren, to: 'fahrts#join'
  end
  resources :accounts
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
