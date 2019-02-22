Rails.application.routes.draw do
  #get 'page/home'
  get 'page/parents' => 'page#parents'
  get 'page/providers' => 'page#providers'
  get 'page/contacts' => 'page#contacts'
  # get  '/home', to: 'static_pages#home'
  
  #get  '/parents', to: 'static_pages#parents'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  
  root 'page#home'
end
