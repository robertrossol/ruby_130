# Write a minitest assertion that will fail if value is not nil.

require 'minitest/autorun'

class Test < MiniTest::Test

  def setup
    @value = nil
  end

  def test_a
    assert_nil(@value) #more explicit and has better failure message
  end

  def test_b
    assert_equal(nil, @value)
  end
end