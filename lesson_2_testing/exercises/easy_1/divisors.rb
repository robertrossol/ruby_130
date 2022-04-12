# Write a method that returns a list of all of the divisors of the positive integer passed in as an argument. The return value can be in any sequence you wish.

def time_it
  start_time = Time.now
  yield if block_given?
  end_time = Time.now
  puts "Took #{end_time - start_time} sec."
end

def divisors(arg)
  # 1.upto(arg / 2).select { |num| arg % num == 0 } << arg
  result = []
  1.upto(Math.sqrt(arg)).each { |num| result << num << (arg/num) if arg % num == 0 }
  result.sort.uniq
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
time_it { divisors(99400891) == [1, 9967, 9973, 99400891] } # may take a minute