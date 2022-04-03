def select(array)
  counter = 0
  result = []
  while counter < array.size
    result << array[counter] if yield(array[counter])
    counter += 1
  end

  result
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }
p select(array) { |num| puts num }
p select(array) { |num| num + 1 }
