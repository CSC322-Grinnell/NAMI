require 'test_helper'

class ProviderTest < ActiveSupport::TestCase
  object = Provider.new({:practiceName => "Provider 1", :address => "Address 1", :phone => "1234"})
  
  test "provider_responds_to_methods" do
    assert_respond_to(object, :waivers)
    assert_respond_to(object, :address)
    assert_respond_to(object, :practiceName)
    assert_respond_to(object, :phone)
    assert_respond_to(object, :description)
  end
  
  test "valid provider" do
    assert object.valid?
  end
  
  test "invalid provider without practiceName" do
    provider = Provider.new({:practiceName => nil, :address => "Address 1", :phone => "1234"})
    refute provider.valid?
  end
  
  test "invalid provider without address" do
    provider = Provider.new({:practiceName => "Provider 1", :address => nil, :phone => "1234"})
    refute provider.valid?
  end
  
  test "invalid provider without phone" do
    provider = Provider.new({:practiceName => "Provider 1", :address => "Address 1", :phone => nil})
    refute provider.valid?
  end
end
