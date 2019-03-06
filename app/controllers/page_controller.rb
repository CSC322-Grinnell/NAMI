class PageController < ApplicationController
  def home
  end
  
  def parents
  end
  
  def providers
  end
  
  def contacts
  end
  
  def signup
  end
  
  def post_create_user
    
    puts(params.inspect)
    
    username = params[:username]
    password = params[:password]
    confirm = params[:confirm]
    provider_name = params[:provider_name]
    address = params[:address]
    phone = params[:phone]
    emial = params[:email]
    
    arr = [username, password, confirm, provider_name, address, phone, email]
    
    if arr.any? {|user_input| user_input == ""} then
      redirect_to '/page/signup'
      @error_message = "Must fill all required fields!"
    else
      redirect_to '/page/login'
    end
    
  end
end
