require 'test_helper'

class ProviderTest < ActiveSupport::TestCase
  test "valid provider" do
    provider = Provider.new({:practiceName => "Provider 1", :address => "Address 1", :phone => "1234"})
    assert provider.valid?
  end
  
  test "invalid provider without practiceName" do
    provider = Provider.new({:practiceName => nil, :address => "Address 1", :phone => "1234"})
    refute provider.valid?
    #assert_not_nil provider.errors[:practiceName]
  end
  
  test "invalid provider without address" do
    provider = Provider.new({:practiceName => "Provider 1", :address => nil, :phone => "1234"})
    refute provider.valid?
    #assert_not_nil provider.errors[:address]
  end
  
  test "invalid provider without phone" do
    provider = Provider.new({:practiceName => "Provider 1", :address => "Address 1", :phone => nil})
    refute provider.valid?
    #assert_not_nil provider.errors[:phone]
  end
end
