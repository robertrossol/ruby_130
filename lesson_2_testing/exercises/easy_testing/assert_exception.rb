# Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.

require 'minitest/autorun'

class Test < MiniTest::Test

  def setup

  end

  def test_a
    # employee = nil
    assert_raises NoExperienceError do
      employee.hire
    end
  end
end