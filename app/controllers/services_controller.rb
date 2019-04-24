class ServicesController < ApplicationController
    def new
        @provider_id = params[:id]
    end
    
    def create
        @s = Service.new(service_params)
        if @s.save
            flash[:success] = ["Service saved!"]
            redirect_to providers_profile_path
        else
            flash.now[:errors] = @s.errors.full_messages
            render 'new'
        end
    end
    
    def edit
        @service = Service.find(params[:id])
        @branches = @service.branch
    end
    
    def update
        @service = Service.find(params[:id])
        if @service.update_attributes(service_params)
            flash[:success] = ["Service updated!"]
            if current_user.admin?
                redirect_to admins_index_path
            else
                redirect_to providers_profile_path
            end
        else
            flash.now[:errors] = @service.errors.full_messages
            render 'edit'
        end
    end
    
    def service_params
      params.require(:service).permit(:provider_id, :service_name, :description, :branch => [])
    end
end
    