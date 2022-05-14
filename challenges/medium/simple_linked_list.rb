class SimpleLinkedList
  include Enumerable
  
  attr_reader :elements

  def initialize
    @elements = []
  end

  def self.from_a(arr)
    list = new
    arr&.reverse&.each do |datum|
      list.push(datum)
    end
    list
  end

  def each(*args, &block)
    elements.each(*args, &block)
  end

  def push(el)
    elements.push(Element.new(el, elements[-1]))
    # elements[-2].next = el unless elements.size <= 1
    # element.next = elements[-2] unless elements.size <= 1
    elements[elements.size - 1]
  end

  def pop
      elements.pop.datum
    # el.datum
  end

  def head
    elements[-1]
  end

  def size
    elements.size
  end

  def empty?
    elements.empty?
  end

  def peek
    head&.datum
  end

  def to_a
    elements.map(&:datum).reverse
  end

  def reverse
    self.class.from_a(elements.map(&:datum))
    # elements.reverse
  end
end

class Element
  attr_accessor :next

  def initialize(data, pointer = nil)
    @data = data
    @next = pointer
  end

  def datum
    @data
  end

  def tail?
    @next.nil?
  end
end