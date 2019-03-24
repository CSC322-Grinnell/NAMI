class PageController < ApplicationController
  def home
  end
  
  def parents
  end
  
  def contacts
  end
  
  def providers
    redirect_to user_session_path
  end
  
  def profile
  end
end
