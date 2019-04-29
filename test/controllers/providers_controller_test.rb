require 'test_helper'
require 'helpers/login.rb'

class ProvidersControllerTest < ActionDispatch::IntegrationTest
    include LoginProcess
    include Devise::Test::IntegrationHelpers
    
    def a_user
        User.new(email: "qinyi@grinnell.edu", admin: false, encrypted_password: User.new.send(:password_digest, '1234567'))
    end
    
    def an_admin
        User.new(email: "qinyi2000@outlook.com", admin: true, encrypted_password: User.new.send(:password_digest, '1234567'))
    end
    
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
end