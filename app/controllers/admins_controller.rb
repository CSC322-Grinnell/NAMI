class AdminsController < ApplicationController
  
    include AdminHelper
    before_action :authenticate_admin! # authenticates admin status
    
    def grant_admin
      User.find(params[:id]).update_attribute :admin, true
      if p = Provider.find_by_user_id(params[:id])
        p.delete
      end
      redirect_to admins_index_path
    end
    
    def index
      @users = User.order(:admin)
    end
    
    def destroy_user
      if p = Provider.find_by_user_id(params[:id])
        p.delete
      end
      User.find(params[:id]).delete
      redirect_to admins_index_path
    end
    
    def create_account
      user = User.new(configure_permitted_parameters)
      if user.save
        provider = Provider.new(configure_permitted_parameters.provider_params)
        if provider.save
          user.provider = provider
          redirect_to admins_index_path
        else
          flash.now[:errors] = user.errors.full_messages + provider.errors.full_messages
          render 'create_account'
        end
      end
    end
    
    def form_params
      devise_parameter_sanitizer.sanitize(:sign_up)
    end
end