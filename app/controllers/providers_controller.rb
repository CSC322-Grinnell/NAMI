class ProvidersController < ApplicationController
    before_action :authenticate_user!

    def new
    end
    
    def create
      @p = Provider.new(provider_params)
      if @p.save
        flash[:success] = "Profile created!"
        redirect_to '/providers/profile'
      else
        flash[:errors] = @p.errors
        render new_provider_path
      end
    end
    
    
    private

    def provider_params
      params.require(:provider).permit(:user_id, :practiceName, :address, :phone, :description)
    end
end