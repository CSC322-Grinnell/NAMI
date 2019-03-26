class PageController < ApplicationController
  def providers
    if user_signed_in?
      redirect_to '/providers/profile'
    else 
      redirect_to user_session_path
    end
  end
end
