require 'test_helper'

class PageControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
  end
  
  test "should get parents" do
    get page_parents_url
    assert_response :success
  end
  
  test "should get contacts" do
    get page_contacts_url
    assert_response :success
  end
  
  ########### This test is problematic #########
  test "should get from providers to signup" do
    get page_providers_url
    assert_redirected_to user_session_path
  end
  ####################
  test "should get disorders" do
    get page_disorders_url
    assert_response :success
  end
  
  test "should get resources" do
    get page_resources_url
    assert_response :success
  end
end
