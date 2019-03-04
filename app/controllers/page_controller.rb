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
    
    username = params[:username];
    password = params[:password];
    
    if (username == "a") then
      redirect_to '/page/parents'
    else
      redirect_to '/'
    end
    
  end
end
