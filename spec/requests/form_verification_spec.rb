require 'rails_helper'
require 'login_helper'

RSpec.configure do |c|
  c.include Devise::Test::IntegrationHelpers
  c.include LoginHelper
  c.include Rails.application.routes.url_helpers
end

RSpec.describe "User Form" do
  before(:each) do
    @user_params = { :email => "shelby@example.com", :password => "1234567890",
                     :password_confirmation => "1234567890"}
  end

  pending "should be able to create user if form is completed" do
    expect{get new_user_registration_path, params: @user_params}.to change{User.count}
    expect(response).to have_http_status(:redirect)
    follow_redirect!
    expect(response).to have_http_status(:success)
    expect(response).to have_tag ".alert-success", "Account created!"
  end

  it "shouldn't create user if form is not correctly filled" do
    @user_params[:password_confirmation] = "012"
    expect{get new_user_registration_path, params: @user_params}.to_not change{User.count}
    expect(response).to have_http_status(:success)
  end
end
