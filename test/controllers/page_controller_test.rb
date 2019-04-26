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
  
  test "should get providers" do
    get page_providers_url
    assert_response :success
  end
  
  test "should get signup" do
    get page_signup_url
    assert_response :success
  end

end
