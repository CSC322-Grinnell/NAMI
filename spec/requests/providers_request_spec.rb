require 'rails_helper'
require 'login_helper'

RSpec.configure do |c|
  c.include Devise::Test::IntegrationHelpers, type: :request
  c.include LoginHelper
  c.include Rails.application.routes.url_helpers
end

RSpec.describe "Providers Request when signed in with user" do
  before(:each) do
    @user = a_user
    sign_in @user
  end
  it "should get new page" do
    get '/providers/new'
    expect(response).to have_http_status(:success)
  end

  it "should get profile" do
    get '/providers/profile'
    expect(response).to have_http_status(:success)
  end


  it "should get edit page" do
    get edit_provider_path(Provider.first)
    expect(response).to have_http_status(:success)
  end

  it "should create provider" do
    post providers_create_url,
         params: { provider: {
                     practiceName: "1",
                     address: "1",
                     phone: "12",
                     description: "something",
                     user_id: User.find_by_email("shelby@grinnell.edu")
                 }}
    expect(response).to redirect_to(providers_profile_url)
  end

  pending "should update provider" do
    put provider_url(Provider.first),
        params: { provider: {
                    practiceName: "1",
                    address: "1",
                    phone: "12",
                    description: "something",
                    user_id: User.find_by_email("shelby@grinnell.edu")
                  }}
    expect(response).to have_http_status(:success)
  end
end
