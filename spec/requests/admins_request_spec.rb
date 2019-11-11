require 'rails_helper'
require 'login_helper'

RSpec.configure do |c|
  c.include Devise::Test::IntegrationHelpers, type: :request
  c.include LoginHelper
  c.include Rails.application.routes.url_helpers
end

RSpec.describe "Admins Request when signed in with user" do
  before(:each) do
    @admin = an_admin
    sign_in @admin
  end

  it "should get index" do
    get admins_index_url
    expect(response).to have_http_status(:success)
  end

  it "should get show page" do
    get admin_show_account_url(@user)
    expect(response).to have_http_status(:success)
  end

  it "should get edit page" do
    get admin_edit_account_url(@user)
    expect(response).to have_http_status(:success)
  end

  it "should access new account page" do
    get admin_new_account_url
    expect(response).to have_http_status(:success)
  end

  it "should update account" do
    put admin_update_account_url(@user), params: {
          user: { email: "shelby1@grinnell.edu",
                  password: "password",
                  provider: { practiceName: "Provider1",
                              address: "1",
                              phone: "111-111-1111",
                              description: "An example provider" }}}
    expect(response).to have_http_status(:redirect)
  end

  it "should destroy user" do
    delete admins_destroy_user_url(@user)
    expect(response).to have_http_status(:redirect)
  end

  pending "should create create new account" do
    post admin_create_account_url, params: {
          user: { email: "shelby2@grinnell.edu",
                  password: "password1",
                  admin: false },
          provider: { practiceName: "Provider1",
                      address: "1",
                      phone: "111-111-1111",
                      description: "An example provider" }}
    expect(response).to have_http_status(:redirect)
  end
end
