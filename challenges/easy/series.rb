class Series
  def initialize(num_string)
    @num_string = num_string
    @digits = num_string.chars.map(&:to_i)
  end

  def slices(size)
    raise ArgumentError.new if size > @num_string.size
    @digits.each_with_index.with_object([]) do |(digit, idx), arr|
      arr << @digits.slice(idx, size) unless idx + size > @digits.size
    end
    # @digits.each_cons(size).to_a #each_cons
  end
end

series = Series.new('01234')
series.slices(2)
