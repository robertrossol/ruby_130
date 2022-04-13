
def zip(arr1, arr2)
  # size = arr1.size
  # result = []
  # 0.upto(size - 1) do |idx|
  #   result << [arr1[idx], arr2[idx]]
  # end
  # arr1.each_with_index do |el, idx|
  #   result << [el, arr2[idx]]
  # end
  arr1.each_with_object([]).with_index do |(el, arr), index|
    arr << [el, arr2[index]]
  end
  # result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]] 