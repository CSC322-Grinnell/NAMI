require 'test_helper'
require 'helpers/login.rb'
class ProvidersControllerTest < ActionDispatch::IntegrationTest
    include LoginProcess
    
    test "should get new page" do
        ApplicationController.any_instance.stubs(:user_signed_in?).returns(true)
        puts user_signed_in?
        puts new_provider_path
        get "/providers/new"
        assert_response :success
    end
    
    test "should get edit page" do
        ApplicationController.any_instance.stubs(:user_signed_in?).returns(true)
        get edit_provider_path(Provider.first.id)
        assert_response :success
    end
end