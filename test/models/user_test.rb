require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "Example User",
    password: "1234567890", password_confirmation: "1234567890")
  end
  
  test "responds to field methods" do
    assert_respond_to(@user, :username)
  end

  test "should be valid" do
    assert @user.valid?
  end
  
  test "username should be present" do
    @user.username = "     "
    assert_not @user.valid?
  end
  
  test "username should not be too long" do
    @user.username = "a" * 51
    assert_not @user.valid?
  end
  
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
