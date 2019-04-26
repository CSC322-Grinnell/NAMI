require 'test_helper'

class ProvidersControllerTest < ActionDispatch::IntegrationTest
    test "should get new page" do
        get new_provider_path
        assert_response :success
    end
    
    test "should get edit page" do
        get edit_provider_path(Provider.first.id)
        assert_response :success
    end
end