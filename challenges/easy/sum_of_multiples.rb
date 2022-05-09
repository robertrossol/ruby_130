
class SumOfMultiples
  def initialize(*args)
    @num_set = args.empty? ? [3, 5] : args
    # @num_set = args
  end

  def self.to(num)
    # @num_set = [3,5]
    new(3, 5).to(num)
  end

  def to(num)
    ((@num_set.sort.first)...num).reduce(0) do |sum, el| #we can start the range at the lowest potential multiple, instead of 1
      any_multiple?(el) ? sum + el : sum
    end
    # ((@num_set.sort.first)...num).each_with_object([]) do |el, arr|
    #   arr << el if any_multiple?(el)
    # end.sum
  end

  def any_multiple?(num)
    @num_set.any? do |multiple|
      (num % multiple).zero?
    end
  end
end

x = SumOfMultiples.new(3,4, 12)
p x.to(20)