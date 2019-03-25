class PageController < ApplicationController
  def providers
    if user_signed_in?
      if p = Provider.find_by_user_id(current_user.id)
        session[:provider] = p
      end
      redirect_to '/page/profile'
    else 
      redirect_to user_session_path
    end
  end
end
