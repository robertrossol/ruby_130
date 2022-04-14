# Write a minitest assertion that will fail if the Array list is not empty.

require 'minitest/autorun'

class Test < MiniTest::Test

  def setup
    @list = []
    # @list = [5, 7, "hi"]
  end

  def test_a
    assert_empty(@list) #more explicit and has better failure message
  end

  def test_b
    assert_equal true, @list.empty?
  end
end