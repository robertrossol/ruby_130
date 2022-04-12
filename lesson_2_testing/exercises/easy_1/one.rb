# Write a method called one? that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return true if the block returns true for exactly one of the element values. Otherwise, it should return false.

# Your method should stop processing elements of the Array as soon as the block returns true a second time.

# If the Array is empty, one? should return false, regardless of how the block is defined.

# Your method may not use any standard ruby method that is named all?, any?, none?, or one?.

# def one?(collection)
#   trues = 0
#   collection.each do |el|
#     trues += 1 if yield(el)
#     break if trues > 1
#   end
#   trues == 1
# end

def one?(collection)
  one_true = false
  collection.each do |el|
    next unless yield(el)
    return false if one_true
    one_true = true
  end
  one_true
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false