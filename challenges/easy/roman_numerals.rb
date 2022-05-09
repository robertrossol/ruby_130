# Write some code that converts modern decimal numbers into their Roman number equivalents.
{1 => "I", 4 => "IV", 5 => "V", 9 => "IX", 10 => "X", 40 => "XL", 50 => "L", 90=> "XC", 100 => "C", 400 => "CD", 500 => "D", 900=> "CM", 1000=> "M"}

#Problem: Convert integer to Roman Numeral equivalent
# 1. num to_s 506 -> '506'/ num_digits = num.to_s.size 3
# 2. 

class RomanNumeral
  CONVERSION = {
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I"
  }
  attr_reader :int #:digits
  def initialize(int)
    @int = int
    # @digits = to_digits
  end

  # def to_digits #506
  #   size = int.to_s.size #3
  #   digits = int.to_s.split('')#.map(&:to_i)
    
  #   size.downto(1).with_index do |num, idx|
  #     digits[idx] = digits[idx].ljust(num, "0").to_i
  #   end
  #   digits - [0]
  # end

  def to_roman
    num_to_convert = int
    roman_numerals = ''
    CONVERSION.each do |key, value|
      multiplier, remainder = num_to_convert.divmod(key)
      next if multiplier == 0
      roman_numerals += value * multiplier
      num_to_convert = remainder
      # while num_to_convert >= key
      #   num_to_convert -= key
      #   roman_numerals += value
      # end
    end
    roman_numerals
  end
end

x = RomanNumeral.new(2798)
p x.to_roman
