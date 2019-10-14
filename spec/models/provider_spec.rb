require 'rails_helper'

RSpec.describe Provider do
  before(:each) do
    @provider = Provider.new(practiceName: "Provider 1", address: "Address 1",
                           phone: "1234", user: User.find_by_email("qinyi@grinnell.edu"))
  end

  it "is valid with valid attributes" do
    expect(@provider).to be_valid
  end

  it "invalid provider without a practiceName" do
    @provider.practiceName = nil
    expect(@provider).to_not be_valid
    @provider.practiceName = ''
    expect(@provider).to_not be_valid
  end

  it "invalid provider without an address" do
    @provider.address = nil
    expect(@provider).to_not be_valid
    @provider.address = ''
    expect(@provider).to_not be_valid
  end

  it "invalid provider without phone" do
    @provider.phone = nil
    expect(@provider).to_not be_valid
    @provider.phone = ''
    expect(@provider).to_not be_valid
  end
end
