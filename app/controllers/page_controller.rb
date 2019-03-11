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

    # @provider = Provider.new(practiceName: provider_name, address: address,
    # phone: phone, email: email)
    @user = User.new(username: username, password: password,
    password_confirmation: confirm)
    
    @provider = Provider.new(practiceName: provider_name, address: address,
    phone: phone, email: email)
    
    a = @provider.save
    b = @user.save
    
    if a && b
      @user.provider = @provider
      flash = {:success => "Account created!", :fail => "Error!"}
      redirect_to '/page/providers'
    else
      puts @user.errors.full_messages
      puts @provider.errors.full_messages
      flash[:error_signup] = @provider.errors.full_messages + @user.errors.full_messages
      render 'signup'
    end
  end
  
  def signup
    @error_message = flash[:error_signup] # flash only passes error message from
                                    # post_create_user and then disappears
  end
end
