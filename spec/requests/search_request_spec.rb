require 'rails_helper'
require 'login_helper'

RSpec.configure do |c|
  c.include Devise::Test::IntegrationHelpers, type: :request
  c.include LoginHelper
  c.include Rails.application.routes.url_helpers
end

RSpec.describe "Search Request" do
  it "should successfully search no query" do
    get data_serach_url # Typo in name to be corrected
    expect(response).to have_http_status(:success)
  end

  it "should successfully search with query" do
    get data_serach_url, params: {query: "Practice"}
    expect(response).to have_http_status(:success)
  end

  it "should load advanced search" do
    get search_advanced_search_url
    expect(response).to have_http_status(:success)
  end

  it "should successfully get advanced search results" do
    @query = { query: "P", waiveroptions: "", insuranceoptions: "", addressoptions: ""}
    get search_advanced_search_result_url, params: @query
    expect(response).to have_http_status(:success)
  end

  it "should go to profile" do
    @user = a_user
    get go_to_profile_url(@user.provider)
    expect(response).to have_http_status(:success)
  end
end
