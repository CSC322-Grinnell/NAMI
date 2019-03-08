require 'test_helper'

class FormFieldCheckTest < ActionDispatch::IntegrationTest
  test "should render title" do
    get '/'
    assert_select "h1", "NAMI Johnson County Database"
  end
  
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
  
  test "should return error message if not all fields filled" do
    get '/page/signup'
    
    post '/page/post_create_user',
      params: {:username => "", :password => "123", :confirm => "123", :provider_name => "provider", :address => "address", :phone => "phone", :email => "email"
      }
      assert_response(204) # no actions
  end
  
  test "should return error message if passwords don't match" do
    get '/page/signup'
    
    post '/page/post_create_user',
      params: {:username => "user", :password => "122", :confirm => "123", :provider_name => "provider", :address => "address", :phone => "phone", :email => "email"
      }
      assert_response(204) # noactions
  end
      
end
