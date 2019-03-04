Rails.application.routes.draw do
  #get 'page/home'
  get 'page/parents' => 'page#parents'
  get 'page/providers' => 'page#providers'
  get 'page/contacts' => 'page#contacts'
  get 'page/login' => 'page#login'
  get 'page/profile' => 'page#profile'
  get 'page/signup' => 'page#signup'
  # get  '/home', to: 'static_pages#home'
  
  get 'page/addprovider' => 'providers#new'
  
  #get  '/parents', to: 'static_pages#parents'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'page#home'
end
