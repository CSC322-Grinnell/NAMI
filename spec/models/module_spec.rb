require 'rails_helper'

RSpec.describe Provider do
  it { is_expected.to respond_to(:waivers) }
  it { is_expected.to respond_to(:services) }
  it { is_expected.to respond_to(:address) }
  it { is_expected.to respond_to(:practiceName) }
  it { is_expected.to respond_to(:phone) }
  it { is_expected.to respond_to(:description) }
  it { is_expected.to respond_to(:user_id) }
  it { is_expected.to respond_to(:insurance) }
end

RSpec.describe Service do
  it { is_expected.to respond_to(:service_name) }
  it { is_expected.to respond_to(:description) }
  it { is_expected.to respond_to(:branch) }
  it { is_expected.to respond_to(:provider_id) }
end

RSpec.describe User do
  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:encrypted_password) }
  it { is_expected.to respond_to(:provider) }
  it { is_expected.to respond_to(:admin) }
  it { is_expected.to respond_to(:reset_password_token) }
end

RSpec.describe Waiver do
  it { is_expected.to respond_to(:braininjury) }
  it { is_expected.to respond_to(:intellectualdisability) }
  it { is_expected.to respond_to(:childrensmentalhealth) }
  it { is_expected.to respond_to(:provider_id) }
end
