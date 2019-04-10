class AdminsController < ApplicationController
  
    include AdminHelper
    include CheckboxParams
    
    before_action :authenticate_admin! # authenticates admin status
    
    def index
      @users = User.order(:admin)
    end
    
    def show
      @provider = Provider.find(params[:id])
      @insurance_params = insurance_params
    end
    
    def destroy_user
      if p = Provider.find_by_user_id(params[:id])
        p.delete
      end
      User.find(params[:id]).delete
      redirect_to admins_index_path
    end
    
    def new_account
      @insurance_params = insurance_params
    end
    
    def create_account
      info = form_params
      info[:provider] = Provider.new(form_params[:provider])
      user = User.new(info)
      if user.save
        redirect_to admins_index_path
      else
        flash.now[:errors] = user.errors.full_messages
        redirect_to admin_create_account
      end
    end
    
    def form_params
      params.require(:user).permit(:email, :password, :provider => [:practiceName, :address, :phone, :description, :insurance => []])
    end
end