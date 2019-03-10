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
    @object.practiceName = nil
    refute @object.valid?
    @object.practiceName = ""
    refute @object.valid?
  end
  
  test "invalid provider without address" do
    @object.practiceName = "something"
    @object.address = nil
    refute @object.valid?
    @object.address = ""
    refute @object.valid?
  end
  
  test "invalid provider without phone" do
    @object.address = "address"
    @object.phone = nil
    refute @object.valid?
    @object.phone = ""
    refute @object.valid?
  end
end
