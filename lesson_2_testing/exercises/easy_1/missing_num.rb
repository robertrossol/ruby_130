# Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument

# def missing(arr)
#   (arr[0]..arr[-1]).to_a - arr
# end

# def missing(arr)
#   result = []
#   index = 0
#   while index < arr.size - 1
#     value = arr[index] + 1
#     next_value = arr[index + 1]
#     index += 1
#     next if value == next_value

#     result += (value...next_value).to_a
#   end
#   result
# end

def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

p missing([-3, -2, 1, 2, 2, 5]) == [-1, 0, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []