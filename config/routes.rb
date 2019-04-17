Rails.application.routes.draw do
  devise_for :users
  
  #routes to webpages 
  #get 'page/home'
  get 'page/parents' => 'page#parents'
  get 'page/providers' => 'page#providers'
  get 'page/contacts' => 'page#contacts'
  get 'providers/profile' => 'providers#profile'
  get 'page/disorders' => 'page#disorders'
  get 'page/resources' => 'page#resources'
  
  #routes  for search
  match 'search/search' => 'search#search', :via => :get, :as => :data_serach
  resources :search, only: [:search]
  
  #routes for provider model
  post 'providers/create' => 'providers#create'
  resources :providers
  
  #routes to admin management
  post 'admins/admin' => 'admins#admin'
  get 'admins/index' => 'admins#index'
  
  match "admins/update/:id" => "admins#update", :via => :put, :as => :admin_update_account
  match 'admins/destroy_user/:id' => "admins#destroy_user", :via => :delete, :as => :admins_destroy_user
  match "admins/new_account" => "admins#new_account", :via => :get, :as => :admin_new_account
  match "admins/create_account" => "admins#create_account", :via => :post, :as => :admin_create_account
  match "admins/show/:id" => "admins#show", :via => :get, :as => :admin_show_account
  match "admins/edit/:id" => "admins#edit", :via => :get, :as => :admin_edit_account
  get "search/advanced_search" 
  get "search/advanced_search_result"
  #get 'admins/update/:id' => 'admins#update'
  
  #routes to create/update services for a provider
  match "services/new" => "services#new", :via => :get, :as => :new_service
  match "services/create" => "services#create", :via => :post, :as => :create_service
  match "services/edit/:id" => "services#edit", :via => :get, :as => :edit_service
  match "services/update/:id" => "services#update", :via => :put, :as => :update_service
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # post and get methods should be defined separately
  root 'page#home'
end
