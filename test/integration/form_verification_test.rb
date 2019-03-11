require 'test_helper'

class FormVerificationTest < ActionDispatch::IntegrationTest
  test "should be able to create user if form is completed" do
    
    assert_changes 'User.count' do
    post '/page/post_create_user',
      params: {:username => "user", :password => "1234567890", :confirm => "1234567890", :provider_name => "provider", :address => "address", :phone => "phone", :email => "qinyi@email.com"
      }
    end
    
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "span", "Account created!"
      
  end
  
  test "don't create user if form not correctly filled" do
    assert_no_difference 'User.count' do 
      post '/page/post_create_user',
        params: {:username => "user", :password => "1234567", :confirm => "123456790", :provider_name => "provider", :address => "address", :phone => "phone", :email => "email"
      }
      
    assert_response :success
    end
  end
    
end
