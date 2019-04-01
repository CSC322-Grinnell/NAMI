class AdminsController < ApplicationController
  
    include AdminHelper
    before_action :authenticate_admin!
    
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
end