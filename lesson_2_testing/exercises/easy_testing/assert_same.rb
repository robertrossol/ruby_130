# Write a test that will fail if list and the return value of list.process are different objects.

require 'minitest/autorun'

class Test < MiniTest::Test

  def setup
    @list = []
  end

  def test_a
    same_list = @list
    assert_same @list, same_list
  end

  def test_b
    assert_same @list, []
  end
end