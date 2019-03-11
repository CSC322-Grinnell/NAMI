class PageController < ApplicationController
  def home
  end
  
  def parents
  end
  
  def contacts
  end
  
  def post_login
    username = params[:username]
    password = params[:password]
    
    arr = [username, password]
    if arr.any? {|user_input| user_input == "" or user_input == nil} then
      flash[:error_login] = "must fill all fields"
      redirect_to '/page/providers'
    else
      redirect_to '/page/profile'
    end
  end
  
  def providers
    @error_message = flash[:error_login]
  end
  
  def post_create_user
    username = params[:username]
    password = params[:password]
    confirm = params[:confirm]
    provider_name = params[:provider_name]
    address = params[:address]
    phone = params[:phone]
    email = params[:email]
    
    arr = [username, password, confirm, provider_name, address, phone, email]
    
    if arr.any? {|user_input| user_input == "" or user_input == nil} then
      flash[:error_signup] = "must fill all fields"
      redirect_to '/page/signup'
    elsif confirm != password then
      flash[:error_signup] = "passwords don't match"
      redirect_to '/page/signup'
    else
      # add provider to database, create a new user associated with this provider
      redirect_to '/page/providers'
    end
  end
  
  def signup
    @error_message = flash[:error_signup] # flash only passes error message from
                                    # post_create_user and then disappears
  end
end
