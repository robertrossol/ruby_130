class CustomSet
  attr_reader :data
  def initialize(data = [])
    @data = data.uniq
  end

  def empty?
    data.empty?
  end

  def contains?(el)
    data.include?(el)
  end

  def subset?(other_set)
    data.all? { |el| other_set.contains?(el) }
  end

  def disjoint?(other_set)
    data.none? { |el| other_set.contains?(el) }
  end

  def eql?(other_set)
    data.sort == other_set.data.sort
  end

  def add(el)
    data.push(el) unless contains?(el)
    self
  end

  def intersection(other_set)
    same_elements = data.select { |el| other_set.contains?(el) }
    CustomSet.new(same_elements)
  end

  def difference(other_set)
    different_elements = data.select { |el| !other_set.contains?(el) }
    CustomSet.new(different_elements)
  end

  def union(other_set)
    merged_elements = data + other_set.difference(self).data
    CustomSet.new(merged_elements)
  end

  alias_method :==, :eql?

end

set = CustomSet.new([1, 2, 3])
p set.data
p set.contains?(1)