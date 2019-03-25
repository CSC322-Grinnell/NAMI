class ProvidersController < ApplicationController
    def new
    end
    
    def create
      p.inspect
      provider_params.inspect
      p = Provider.new(provider_params)
      if p.save
        flash[:success] = "Profile created!"
        redirect_to '/page/profile'
      else
        render new_provider_path
      end
    end
    
    private

    def provider_params
      params.require(:provider).permit(:user_id, :practiceName, :address, :phone, :description)
    end
end