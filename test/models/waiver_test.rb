require 'test_helper'

class WaiverTest < ActiveSupport::TestCase
  test "valid waiver" do
    waiver = Waiver.new()
    assert waiver.valid?
  end
end
