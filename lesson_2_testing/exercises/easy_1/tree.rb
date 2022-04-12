# For this exercise, modify the Tree class to support the methods of Enumerable. You do not have to actually implement any methods -- just show the methods that you must provide.

class Tree
  include Enumerable

  def each
    #need Enumerable plus an each method that yields each member of the collection, one at a time.
  end
end