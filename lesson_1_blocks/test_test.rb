require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'test'

class CipherTest < MiniTest::Test
  def test_encode_no
    assert_equal 'ml', Cipher.encode('no')
  end

  def test_encode_yes
    assert_equal 'bvh', Cipher.encode('yes')
  end

  def test_encode_OMG
    assert_equal 'lnt', Cipher.encode('OMG')
  end

  def test_encode_O_M_G
    assert_equal 'lnt', Cipher.encode('O M G')
  end

  def test_encode_long_word
    assert_equal 'nrmwy oldrm tob', Cipher.encode('mindblowingly')
  end

  def test_encode_numbers
    assert_equal('gvhgr mt123 gvhgr mt',
                 Cipher.encode('Testing, 1 2 3, testing.'))
  end

  def test_encode_sentence
    assert_equal 'gifgs rhurx grlm', Cipher.encode('Truth is fiction.')
  end

  def test_encode_all_the_things
    plaintext = 'The quick brown fox jumps over the lazy dog.'
    cipher = 'gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt'
    assert_equal cipher, Cipher.encode(plaintext)
  end
end