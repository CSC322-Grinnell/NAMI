require 'test_helper'

class WaiverTest < ActiveSupport::TestCase
  provider = Provider.first
  waiver = provider.waivers.create({:braininjury => true})
  
  test "waiver responds to methods" do
    assert_respond_to(waiver, :braininjury)
    assert_respond_to(waiver, :intellectualdisability)
    assert_respond_to(waiver, :childrensmentalhealth)
  end
  
  test "valid waiver that belongs to a provider" do
    assert waiver.valid?
  end
  
  test "invalid waiver without correspondence with provider" do
    waiver = Waiver.new({:braininjury => true})
    refute waiver.valid?
  end
end
