# Write a minitest assertion that will fail if value.downcase does not return 'xyz'.
require 'minitest/autorun'

class Test < MiniTest::Test

  def setup
    @value = "XyZ"
  end

  def test_a
    assert_equal('xyz', @value.downcase)
  end

end