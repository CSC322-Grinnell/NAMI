class PageController < ApplicationController
  def home
  end
  
  def parents
  end
  
  def contacts
  end
  
  def providers
  end
  
  def signup
  end

  def post_login
    username = params[:username]
    password = params[:password]
    
    @user = User.find_by(username: username)
    if @user && @user.authenticate(password) # successful login
      flash[:success] = ["Welcome!"]
      redirect_to '/page/profile', {:user => @user}
    else # unsuccessful login
      flash.now[:error_login] = ["Invalid username or password!"]
      render 'providers'
    end
  end

  before_action :authenticate_user!
  def post_create_user
    
    username = params[:username]
    password = params[:password]
    confirm = params[:confirm]
    provider_name = params[:provider_name]
    address = params[:address]
    phone = params[:phone]
    email = params[:email]

    @user = User.new(username: username, password: password,
    password_confirmation: confirm, email: email)
    
    @provider = Provider.new(practiceName: provider_name, address: address,
    phone: phone)
    
    b = @user.save
    a = @provider.save
    
    if a && b
      @user.provider = @provider
      flash[:success] = ["Account created!"]
      redirect_to '/page/providers'
    else
      puts @user.errors.full_messages
      puts @provider.errors.full_messages
      flash.now[:error_signup] = @provider.errors.full_messages + @user.errors.full_messages
      render 'signup'
    end
  end
  
  def profile
  end
end
