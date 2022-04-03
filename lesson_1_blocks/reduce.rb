def reduce(array, *default_acc) #= array[0])
  counter = 0
  acc = 0
  if !default_acc.empty?
    acc = default_acc[0]
  else
    acc = array[0]
    counter = 1
  end

  while counter < array.size
    acc = yield(acc, array[counter])
    counter += 1
  end
  # array.each do |num|
  #   next if acc == num && acc == array[0]
  #   acc = yield(acc, num)
  # end

  acc
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }
p reduce(array, 10) { |acc, num| acc + num }
# p reduce(array) { |acc, num| acc + num if num.odd? }

array = %w(1 2 3 4 5)
p reduce(array) { |acc, num| acc + num }
p reduce(array, "Hi,") { |acc, num| acc + num }

array = [[0,1], [2,3,4], [1], [5, 6]]
p reduce(array) { |acc, num| acc + num }
p reduce(array, [10]) { |acc, num| acc + num }

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']