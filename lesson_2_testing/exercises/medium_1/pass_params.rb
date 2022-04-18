# Modify the method below so that the display/output of items is moved to a block, and its implementation is left up to the user of the gather method.

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  # items.each { |item| yield(item) }
  yield(items)
  # puts "#{items.join(', ')}"
  puts "Nice selection of food we have gathered!"
end

gather(items) { |items| puts items.join(', ') }

birds = %w(raven finch hawk eagle)
p birds # => ['raven','finch','hawk','eagle']

raven, finch, hawk, eagle = %w(raven finch hawk eagle)
p raven # => 'raven'
p finch # => 'finch'
p hawk # => 'hawk'
p eagle # => 'eagle'

raven, finch, *raptors = %w(raven finch hawk eagle)
p raven # => 'raven'
p finch # => 'finch'
p raptors  # => ['hawk','eagle']

# Based on the examples shown above, write a method that takes an array as an argument. The method should yield the contents of the array to a block, which should assign your block variables in such a way that it ignores the first two elements, and groups all remaining elements as a raptors array.

def params_group(arr)
  yield(arr)
  # x, y, *raptors = arr
  # yield(raptors)
end

params_group(['dog', 'cat', 'bird1', 'bird2']) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(', ')}"
end

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

#1
gather(items) do |*main, last|
  puts main.join(', ')
  puts last
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

# 2
items = ['apples', 'corn', 'cabbage', 'wheat']

gather(items) do |first, *mid, last |
  puts first
  puts mid.join(', ')
  puts last
end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

#3
items = ['apples', 'corn', 'cabbage', 'wheat']

gather(items) do |first, *rest|
  puts first
  puts rest.join(', ')
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

#4
items = ['apples', 'corn', 'cabbage', 'wheat']

gather(items) do |first, second, third, last|
  puts "#{first}, #{second}, #{third}, and #{last}"
  # puts [first, second, third, last].join(', ')
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!