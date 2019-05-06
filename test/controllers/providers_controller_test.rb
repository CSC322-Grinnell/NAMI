require 'test_helper'
require 'helpers/login.rb'

class ProvidersControllerTest < ActionDispatch::IntegrationTest
    include LoginProcess
    include Devise::Test::IntegrationHelpers
    
    test "should get new page when signed in with user" do
        sign_in a_user
        get "/providers/new"
        assert_response :success
    end
    
    test "should get edit page when signed in with user" do
        sign_in a_user
        get edit_provider_path(Provider.first)
        assert_response :success
    end
    
    test "should create provider when user signed in" do
        sign_in a_user
        post '/providers/create', params: { provider: 
            {practiceName: "1", 
            address: "1", 
            phone: "12", 
            description: "something", 
            user_id: User.find_by_email("qinyi@grinnell.edu")
                
            }}
        assert_redirected_to '/providers/profile'
    end
    
    test "should get profile when user signed in" do
        sign_in a_user
        get '/providers/profile'
        assert_response :success
    end
    
    test "should get to edit page when user signed in" do
        sign_in a_user
        get edit_provider_path(Provider.first), params: {provider: 
            {practiceName: "1", 
            address: "1", 
            phone: "12", 
            description: "something", 
            user_id: User.find_by_email("qinyi@grinnell.edu")
                
            }}
        assert_response :success
    end
    
    test "should update provider when user signed in" do
        sign_in a_user
        put provider_path(Provider.first), params: {provider: 
            {practiceName: "1", 
            address: "1", 
            phone: "12", 
            description: "something", 
            user_id: User.find_by_email("qinyi@grinnell.edu")
                
            }}
        assert_response :success
    end
end