class AdminsController < ApplicationController
    
    def grant_admin
      User.find(params[:id]).update_attribute :admin, true
      if p = Provider.find_by_user_id(params[:id])
        p.delete
      end
      redirect_to admins_index_path
    end
    
    def index
      if current_user.try(:admin?) # if user is admin
        @users = User.all
      else
        flash[:errors] = ["Only an Admin can view the accounts!"]
        redirect_to '/providers/profile'
      end
    end
    
    def destroy_user
      if current_user.try(:admin?)
        if p = Provider.find_by_user_id(params[:id])
          p.delete
        end
        User.find(params[:id]).delete
        redirect_to admins_index_path
      else
        flash[:errors] = ["Only an Admin can delete the accounts!"]
        redirect_to '/providers/profile'
      end
    end
end