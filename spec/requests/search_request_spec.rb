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
    Provider.all.each do |p|
      expect(response.body).to include(CGI.escapeHTML(p.name))
    end
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

  it "should successfully get advanced search results empty query" do
    query = { name: "", query: { service_ids: [""], insurance_ids: [""], waiver_ids: [""]}}
    get search_advanced_search_result_url, params: query
    expect(response).to have_http_status(:success)
    Provider.all.each do |p|
      expect(response.body).to include(CGI.escapeHTML(p.name))
    end
  end

  it "should get advanced_search service query" do
    service = Service.create!(name: "Service", description: "description")
    insurance = Insurance.create!(name: "Insurance", phone: "123", website: "www.website.com")
    waiver = Waiver.create!(name: "Waiver")
    @provider.services << service
    @provider.insurances << insurance
    @provider.waivers << waiver
    @provider.save
    query = { name: "", query: { service_ids: [service.id], insurance_ids: [insurance.id], waiver_ids: [waiver.id]}}
    get search_advanced_search_result_url, params: query
    expect(response.body).to include("Provider Example")
    expect(response.body).to_not include("Healthcare, Inc.")
  end

  it "should get advanced_search multi query" do
    service = Service.create!(name: "Service", description: "description")
    other_service = Service.create!(name: "Other Service", description: "desc")
    insurance = Insurance.create!(name: "Insurance", phone: "123", website: "www.website.com")
    waiver = Waiver.create!(name: "Waiver")

    @provider.services << service
    @provider.insurances << insurance
    @provider.waivers << waiver
    @provider.save

    other_provider = Provider.create(name: "Other Provider", address: "Address 2", phone: "1234",
                                     email: "email2@email.edu", description: "description")

    other_provider.services << other_service
    other_provider.insurances << insurance
    other_provider.waivers << waiver
    other_provider.save

    query = { name: "", query: { service_ids: [service.id, other_service.id],
                                 insurance_ids: [insurance.id],
                                 waiver_ids: [waiver.id]}}
    get search_advanced_search_result_url, params: query
    expect(response.body).to include("Provider Example")
    expect(response.body).to include("Other Provider")
    expect(response.body).to_not include("Healthcare, Inc.")
  end

  it "should go to profile" do
    provider = Provider.first
    get go_to_profile_url(provider)
    expect(response).to have_http_status(:success)
  end
end
