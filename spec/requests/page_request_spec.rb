require 'rails_helper'

RSpec.describe "Page Request" do
  it "should get home" do
    get root_url
    expect(response).to have_http_status(:success)
  end

  it "should get parents" do
    get page_parents_url
    expect(response).to have_http_status(:success)
  end

  it "should get contacts" do
    get page_contacts_url
    expect(response).to have_http_status(:success)
  end

  # Problematic test: an if statement
  it "should get providers to signup" do
    get page_providers_url
    expect(response).to redirect_to(user_session_path)
  end

  it "should get disorders" do
    get page_disorders_url
    expect(response).to have_http_status(:success)
  end

  it "should get resources" do
    get page_resources_url
    expect(response).to have_http_status(:success)
  end
end
