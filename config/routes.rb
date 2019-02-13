Rails.application.routes.draw do
  get 'page/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  
  root 'page#home'
end
