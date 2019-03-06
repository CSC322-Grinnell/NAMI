require 'test_helper'
require_relative 'module_test'

class ProviderTest < ActiveSupport::TestCase
  include ProviderRespondTest
  
  def setup
    @object = Provider.new({:practiceName => "Provider 1", :address => "Address 1", 
    :phone => "1234", :email=>"foo@gmail.com"})
  end

  test "valid provider" do
    assert @object.valid?
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
