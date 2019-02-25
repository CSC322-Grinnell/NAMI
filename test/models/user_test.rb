require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "valid user" do
    user = User.new({:business => "Business 1", :type => "Provider_one", :created_at => DateTime.new(2018).in_time_zone, :updated_at => DateTime.new(2018).in_time_zone})
    assert user.valid?
  end
  
  test "invalid user without business" do
    user = User.new({:business => nil, :type => "Provider_one"})
    refute user.valid?, 'Error: User is valid without a name'
  end
end
