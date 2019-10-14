require 'rails_helper'

RSpec.describe User do
  before(:each) do
    @user = User.new(email: 'example@gmail.com',
                     password: '1234567890', password_confirmation: '1234567890')
  end

  it "is valid with valid attributes" do
    expect(@user).to be_valid
  end

  it "invalid provider without email" do
    @user.email = nil
    expect(@user).to_not be_valid
    @user.email = '    '
    expect(@user).to_not be_valid
  end

  it "accepts valid emails" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      expect(@user).to be_valid
    end
  end

  pending "rejects invalid emails" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar...com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      expect(@user).to_not be_valid
    end
  end

  it "saves emails as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    expect(@user.reload.email).to eq(mixed_case_email.downcase)
  end
end
