
class Anagram
  attr_reader :pattern
  def initialize(string)
    @pattern = string.downcase
  end

  def anagram?(a, b)
    a.chars.sort == b.chars.sort && a != b
  end

  def match(arr)
    arr.select do |str|
      # str = str.downcase
      # anagram?(str, pattern)
      anagram?(str.downcase, pattern)
    end
  end
end