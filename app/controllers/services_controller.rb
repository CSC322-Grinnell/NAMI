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
    end
    
    def update
    end
    
    def service_params
      params.require(:service).permit(:provider_id, :service_name, :description, :branch => [])
    end
end
    