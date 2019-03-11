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
    @object.phone = "123"
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @object.email = valid_address
      assert @object.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar...com]
    invalid_addresses.each do |invalid_address|
      @object.email = invalid_address
      assert_not @object.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "email addresses should be unique" do
    duplicate_user = @object.dup
    duplicate_user.email = @object.email.upcase # even if case is different, they should be
    # counted as the same rather than different emails
    @object.save # save to database
    assert_not duplicate_user.valid?
  end
  
  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @object.email = mixed_case_email
    @object.save
    assert_equal mixed_case_email.downcase, @object.reload.email
  end
end
