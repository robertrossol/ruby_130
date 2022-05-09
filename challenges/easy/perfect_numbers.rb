
# comparison between the number and the sum of its positive divisors 

# - Perfect numbers have an Aliquot sum that is equal to the original number.
# - Abundant numbers have an Aliquot sum that is greater than the original number.
# - Deficient numbers have an Aliquot sum that is less than the original number.

class PerfectNumber

  def self.classify(num)
    raise StandardError.new unless num >= 0
    case aliquot(num) <=> num
    when 0
      'perfect'
    when -1
      'deficient'
    when 1
      'abundant'
    end
  end

  class << self

    private

    def aliquot(num)
      # (1...((num/2) + 1)).select do |int|
      #   num % int == 0
      # end.sum
      divisors = [1]
      (2..Math.sqrt(num)).each do |n|
        if num % n == 0
          divisors << n
          divisors << (num / n) unless n == (num / n)
        end
      end
      divisors.sum
    end

  end
end

p PerfectNumber.classify(42)