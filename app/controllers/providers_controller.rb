class ProvidersController < ApplicationController
    before_action :authenticate_user!

    include CheckboxParams
    
    def new
      @insurance_params = insurance_params
      @waiver_params = waiver_params
      @provider = Provider.new
    	render new_provider_path
    end
    
    def create
      if Provider.find_by_id(current_user.id)
        flash[:errors] = ["You already have a provider profile!"]
        redirect_to providers_profile_path
      else
        @p = Provider.new(provider_params)
        if @p.save!
          flash[:success] = "Profile created!"
          redirect_to providers_profile_path
        else
          flash[:errors] = @p.errors.full_messages
          render new_provider_path
        end
      end
    end
    
    def edit
      @provider = Provider.find(params[:id])
      @insurance_params = insurance_params
      @waiver_params = waiver_params
    end
    
    def update
      @provider = Provider.find(params[:id])
      if @provider.update_attributes(provider_params)
        flash[:success] = ["Profile updated!"]
        if current_user.is_admin?
          redirect_to admins_index_path
        else
          redirect_to providers_profile_path
        end
      else
        flash.now[:errors] = @provider.errors.full_messages
        render 'edit'
      end
    end
    
    private

    def provider_params
      params.require(:provider).permit(:id, :name, :address, :phone, :description, :waiver => [], :insurance => [])
    end
    

end
