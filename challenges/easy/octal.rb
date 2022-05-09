
class Octal

  def initialize(str_num)
    @str_num = str_num
    # @digits = str_num.split('').map(&:to_i).reverse
    @digits = str_num.to_i.digits
  end

  def valid_octal?(num)
    !num.match?(/[^0-7]/)
    # return false unless num =~ /[0-7]/ #only works for strings, not ints
  end

  def to_decimal
    return 0 unless valid_octal?(@str_num)
    # return 0 if @str_num.match?(/[^0-7]/)
    # @digits.any? { |digit| digit >= 8 } || @str_num.match?(/[^0-7]/)
    @digits.map.with_index do |digit, index|
      # return 0 unless valid_octal?(digit)
      digit * (8**index)
    end.sum
  end
end

x = Octal.new('233')
p x.to_decimal