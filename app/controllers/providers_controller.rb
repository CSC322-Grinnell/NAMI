class ProvidersController < ApplicationController
    before_action :authenticate_user!

    def new
    end
    
    def create
      if Provider.find_by_user_id(current_user.id)
        flash[:errors] = ["You already have a provider profile!"]
        redirect_to '/providers/profile'
      else
        @p = Provider.new(provider_params)
        if @p.save
          flash[:success] = "Profile created!"
          redirect_to '/providers/profile'
        else
          flash[:errors] = @p.errors.full_messages
          render new_provider_path
        end
      end
    end
    
    def edit
      @provider = Provider.find(params[:id])
    end
    
    def update
    end
    
    private

    def provider_params
      params.require(:provider).permit(:user_id, :practiceName, :address, :phone, :description)
    end
end