require 'rails_helper'
require 'login_helper'

RSpec.configure do |c|
  c.include Devise::Test::IntegrationHelpers, type: :request
  c.include LoginHelper
  c.include Rails.application.routes.url_helpers
end

RSpec.describe "Search Request" do

  before(:each) do
    @provider = Provider.create!(name: "Provider Example", address: "Address 1", phone: "1234",
                                 email: "email@email.edu", description: "description")
    Provider.create!(name: "Healthcare, Inc.", address: "Address 2", phone: "1234",
                     email: "email@differentemail.edu", description: "description")
  end

  it "should successfully search no query" do
    get data_search_url
    expect(response).to have_http_status(:success)
    expect(response.body).to include("Provider Example")
    expect(response.body).to include("Healthcare, Inc.")
  end

  it "should successfully search with query" do
    get data_search_url, params: {query: "Provider"}
    expect(response).to have_http_status(:success)
    expect(response.body).to include("Provider Example")
    expect(response.body).to_not include("Healthcare, Inc.")
  end

  it "should load advanced search" do
    get search_advanced_search_url
    expect(response).to have_http_status(:success)
  end

  xit "should successfully get advanced search results" do
    @query = { query: "P", waiveroptions: "", insuranceoptions: "", addressoptions: ""}
    get search_advanced_search_result_url, params: @query
    expect(response).to have_http_status(:success)
  end

  it "should go to profile" do
    provider = Provider.first
    get go_to_profile_url(provider)
    expect(response).to have_http_status(:success)
  end
end
