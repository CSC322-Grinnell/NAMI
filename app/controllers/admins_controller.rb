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
      info = form_params
      info[:provider] = Provider.new(form_params[:provider])
      user = User.new(info)
      if user.save
        redirect_to admins_index_path
      end
      # if user.save
      #   provider = Provider.new(form_params[:provider])
      #   if provider.save
      #     user.provider = provider
      #     redirect_to admins_index_path
      #   else
      #     flash.now[:errors] = user.errors.full_messages + provider.errors.full_messages
      #     redirect_to 'create_account'
      #   end
      # else
      #   flash.now[:errors] = user.errors.full_messages
      #   redirect_to 'create_account'
      # end
    end
    
    def form_params
      params.require(:user).permit(:email, :password, :provider => [:practiceName, :address, :phone, :description])
    end
end