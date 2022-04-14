require 'minitest/autorun'

class Test < MiniTest::Test

  def setup
    @list = ['xyz', 'abc']
  end

  def test_a
    assert_includes(@list, 'xyz')
  end

  def test_b
    assert_includes(@list, 'xyza')
  end

  def test_c
    assert_equal true, list.include?('xyz')
  end
end