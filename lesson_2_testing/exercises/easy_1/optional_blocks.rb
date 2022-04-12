
def compute
  block_given? ? yield : 'Does not compute.'
  # return 'Does not compute.' unless block_given?
  # yield
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# Modify the compute method so it takes a single argument and yields that argument to the block. Provide at least 3 examples of calling this new version of compute, including a no-block call.

def compute(arg)
  # block_given? ? yield : 'Does not compute.'
  return 'Does not compute.' unless block_given?
  yield(arg)
end

p compute(5) { |arg| arg + 3 } == 8
p compute('a and then ') { |arg| arg + 'b' } == 'a and then b'
p compute(:v) == 'Does not compute.'
