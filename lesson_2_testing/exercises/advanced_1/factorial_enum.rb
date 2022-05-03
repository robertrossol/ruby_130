
fib = Enumerator.new do |y|
  a = b = 1
  loop do
    y << a
    a, b = b, a + b
  end
end

p fib.take(10) # => [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

fact = Enumerator.new do |y|
  # a = 1
  # b = 1
  # loop do
  #   y << b
  #   b = b * a #(1..a).reduce(&:*)
  #   a += 1
  # end
  accumulator = 1
  number = 0
  loop do
    accumulator = number.zero? ? 1 : accumulator * number #(1..number).reduce(&:*)
    y << accumulator
    # y.yield(accumulator)
    number += 1
  end
end

p fact.take(5)

#External Iterators

6.times { |number| puts "#{number}! == #{fact.next}" }
puts "=========================="
6.times { |number| puts "#{number}! == #{fact.next}" }
puts "=========================="
fact.rewind
6.times { |number| puts "#{number}! == #{fact.next}" }
puts "=========================="

#Internal Iterators

fact.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  break if number >= 5
end