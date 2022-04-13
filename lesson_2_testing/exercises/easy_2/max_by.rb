def max_by(collection)
  return nil if collection.empty?
  max_el = collection.first
  max_val = yield(max_el) if max_el
  collection[1..-1].each do |el|
    max_el, max_val = el, yield(el) if yield(el) > max_val
    # max_val = yield(el) > max_val ? yield(el) : max_val
  end
  max_el
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil