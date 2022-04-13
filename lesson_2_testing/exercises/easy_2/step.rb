
def step(start_val, end_val, step)
  current_val = start_val
  # while current_val <= end_val
  #   yield(current_val)
  #   current_val += step
  # end
  loop do
    yield(current_val)
    break if current_val + step > end_val
    current_val += step
  end
  current_val
end

p step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10