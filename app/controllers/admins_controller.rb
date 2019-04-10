class AdminsController < ApplicationController
  
  include AdminHelper
  include CheckboxParams
  
  before_action :authenticate_admin! # authenticates admin status
  
  def index
    @users = User.order(:admin)
  end
  
  def show
    @user = User.find(params[:id])
    @insurance_params = insurance_params
    @waiver_params = waiver_params
  end
  
  def edit
    @user = User.find(params[:id])
    @insurance_params = insurance_params
    @waiver_params = waiver_params
  end
  
  def update
    info = form_params
    # for some reason I have to update provider separately
    # although it shouldn't be the case for nested attributes!
    @user = User.find(params[:id])
    @provider = Provider.find_by_user_id(params[:id])
    @provider.update_attributes(form_params[:provider])
    info[:provider] = @provider
    
    if @user.update_attributes(info)
      flash[:success] = "Updated Successfully!"
      redirect_to admins_index_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to admin_edit_account_path(@user)
    end
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
    @waiver_params = waiver_params
  end
  
  def create_account
    info = form_params
    info[:provider] = Provider.new(form_params[:provider])
    user = User.new(info)
    if user.save
      redirect_to admins_index_path
    else
      flash[:errors] = user.errors.full_messages
      redirect_to admin_create_account
    end
  end
  
  def form_params
    params.require(:user).permit(:email, :password, :provider => [:practiceName, :address, :phone, :description, :waiver => [], :insurance => []])
  end
end