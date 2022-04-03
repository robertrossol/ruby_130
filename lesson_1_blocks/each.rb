
def each(array)
  counter = 0
  while counter < array.size
    yield(array[counter])
    counter += 1
  end

  array
end

p each([1, 2, 3]) { |num| puts num }.select(&:odd?)
