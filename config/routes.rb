Rails.application.routes.draw do
  #get 'page/home'
  get 'page/parents' => 'page#parents'
  get 'page/providers' => 'page#providers'
  get 'page/contacts' => 'page#contacts'
  get 'page/login' => 'page#login'
  get 'page/profile' => 'page#profile'
  get 'page/signup' => 'page#signup'
  post 'page/post_create_user' => 'page#post_create_user'
  
  get 'page/addprovider' => 'providers#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # post and get methods should be defined separately
  root 'page#home'
end
