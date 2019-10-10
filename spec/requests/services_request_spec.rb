require 'rails_helper'
require 'login_helper'

RSpec.configure do |c|
  c.include Devise::Test::IntegrationHelpers, type: :request
  c.include LoginHelper
  c.include Rails.application.routes.url_helpers
end

RSpec.describe "Services Request when signed in with user" do
  before(:each) do
    @user = a_user
    sign_in @user
    @service = Service.create(service_name: "Service 1",
                              provider_id: @user.provider.id,
                              description: "An example service",
                              branch: "Branch 1")
  end

  it "should get new page" do
    get new_service_url(@user.provider.id)
    expect(response).to have_http_status(:success)
  end

  it "should get edit page" do
    get edit_service_url(@service)
    expect(response).to have_http_status(:success)
  end

  it "should update service" do
    put update_service_url(@service), params: {
          service: { service_name: "Service 1",
                     provider_id: @user.provider.id,
                     description: "An example service",
                     branch: "Branch 2"}}
    expect(response).to have_http_status(:redirect)
  end

  it "should create new service" do
    post create_service_url, params: {
           service: { service_name: "NEW Service",
                      provider_id: @user.provider.id,
                      description: "A new service for testing",
                      branch: "Branch 3" }}
    expect(response).to have_http_status(:redirect)
  end
end
