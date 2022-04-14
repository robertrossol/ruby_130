# Write a test that will fail if 'xyz' is one of the elements in the Array list:

require 'minitest/autorun'

class Test < MiniTest::Test

  def setup
    @list = ['abc', 'xyz']
  end

  def test_a
    refute_includes @list, 'xyz'
  end
end