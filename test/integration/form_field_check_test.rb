require 'test_helper'

class FormFieldCheckTest < ActionDispatch::IntegrationTest
  test "should be able to submit if form is completed" do
    get '/page/signup'
    
    post '/page/post_create_user',
      params: {:username => "user", :password => "123", :confirm => "123", :provider_name => "provider", :address => "address", :phone => "phone", :email => "email"
      }
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_select "button", "login" 
  end
  
  test "should say no if not all fields filled" do
    get '/page/signup'
    
    post '/page/post_create_user',
      params: {:username => "", :password => "123", :confirm => "123", :provider_name => "provider", :address => "address", :phone => "phone", :email => "email"
      }
      assert_response :redirect
      follow_redirect!
      assert_select "span", "must fill all fields"
  end
  
  test "should say no if passwords don't match" do
    get '/page/signup'
    
    post '/page/post_create_user',
      params: {:username => "user", :password => "122", :confirm => "123", :provider_name => "provider", :address => "address", :phone => "phone", :email => "email"
      }
      assert_response :redirect
      follow_redirect!
      assert_select "span", "passwords don't match"
  end
 
  # tests of login: 
  test "should be able to submit if login form completed" do 
    get '/page/providers'
    
    post '/page/post_login',
    params: {:username => "user", :password => "password"}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1", "Your profile goes here"
  end
  
  test "should say no if username not filled" do
    get '/page/providers'
    
    post '/page/post_login',
    params: {:username => "", :password => "password"}
    assert_response :redirect
    follow_redirect!
    assert_select "button", "login"
  end
  
  test "should say no if password not filled" do
    get '/page/providers'
    
    post '/page/post_login',
    params: {:username => "user", :password => ""}
    assert_response :redirect
    follow_redirect!
    assert_select "button", "login"
  end
end
