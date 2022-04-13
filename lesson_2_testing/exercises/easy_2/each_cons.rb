
def each_cons(collection)
  # 0.upto(collection.size-2).each do |index|
  #   yield(collection[index], collection[index + 1])
  # end
  collection.each_with_index do |el, index|
    break if index >= collection.size - 1
    yield(el, collection[index + 1])
  end
  nil
end

# def each_cons(collection)
#   index = 0
#   while index < (collection.size - 1)
#     yield(collection[index], collection[index + 1])
#     index += 1
#   end
# end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil