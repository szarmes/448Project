First_Website::Application.routes.draw do
  resources :authentications

  devise_for :users, :controllers => { :registrations => 'registrations' }
  
  #devise_scope :user do 

  root to: 'static_pages#home'

  resources :skills do 
    get :autocomplete_skilllabel_label, :on => :collection
  end
  resources :experiences
  resources :references
  resources :postings
  resources :projects
  resources :links
  resources :profile
  resources :surveys
  resources :network
  resources :messages
  resources :friendships

  match '/search', to: 'search#search', via: 'get'
  match '/findfriend', to: 'network#findfriend', via: 'get'
  match '/results', to: 'surveys#add', via: 'post'
  match '/reccomended', to: 'skills#reccomend', via:'get'
  match '/details', to: 'experiences#details', via: 'get'
  match '/one_ref', to: 'references#one_ref', via: 'get'
  match '/add_exp', to: "experiences#add", via: 'get'
    
  match '/auth/:provider/callback', to: 'authentications#create', via: 'get'
  resources :authentications

  get  'addfriend', to: 'network#addfriend'
  post  'addfriend', to: 'network#addfriend'
  get  'accept', to: 'network#accept'
  get  'decline', to: 'network#decline'
  get 'network', to: 'network#index'
  get 'privatechat', to: 'messages#privatechat'
  get 'storemsg', to: 'messages#storemsg'


   # get 'signin' => 'devise/sessions#new', :as => :new_user_session
   # post 'signin' => 'devise/sessions#create', :as => :user_session
   # delete 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
   # match '/sessions/user', to: 'devise/sessions#create', via: :post
 # end
  




  
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