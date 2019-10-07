require 'rails_helper'
require 'login_helper'

RSpec.configure do |c|
  c.include Devise::Test::IntegrationHelpers
  c.include LoginHelper
  c.include Rails.application.routes.url_helpers
end

RSpec.describe "User Form" do
  before(:each) { sign_in a_user }

  pending "should be able to create user if form is completed" do
    expect(post '/page/post_create_user', params:
                { :username => "user", :password => "1234567890", :confirm => "1234567890",
                  :provider_name => "provider", :address => "address", :phone => "phone",
                  :email => "qinyi@email.com" }
          ).to change{User.count}.by(1)
    expect(response).to have_http_status(:redirect)
    follow_redirect!
    expect(response).to have_http_status(:success)
    expect(response).to have_tag ".alert-success", "Account created!"
  end

  pending "shouldn't create user if form is not correctly filled" do
    expect(post '/page/post_create_user', params:
                { :username => "user", :password => "1234567", :confirm => "123456790", :provider_name => "provider",
                  :address => "address", :phone => "phone", :email => "email" }
          ).to_not change{User.count}.by(1)
  end
end
