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
  
  # def setup
  #   @params_one = {:username =>"", :password => "", :confirm => "", 
  #   :provider_name => "", :address => "", :phone => "", :email => ""}
  #   @params_two = {:username =>"user", :password => "123", :confirm => "124", 
  #   :provider_name => "prov", :address => "Grinnell", :phone => "abc", :email => "foo@gmail.com"}
  #   @params_three = {:username =>"user", :password => "123", :confirm => "123", 
  #   :provider_name => "prov", :address => "Grinnell", :phone => "abc", :email => "foo@gmail.com"}
  # end
  
  # test "should return error when some fields not filled" do
  #   post '/page/post_create_user'
  #   assert_response :error
  # end
  
  # test "should return error when passwords do not match" do
  #   post '/page/post_create_user'
  #   assert_equal (post '/page/post_create_user', false)
  # end
  
  # test "should successfully post when requirements are fulfilled" do
  #   post '/page/post_create_user'
  #   assert_equal ({post '/page/post_create_user', username="1",
  #                     password: "1"
  #                     confirm: "2"
  #                     provider_name: "provider"
  #                     address: "ad"
  #                     phone: "phone"
  #                     email: "foo"}, false)
  # end

end
