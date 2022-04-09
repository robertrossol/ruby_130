# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = "X"
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(other_todo)
    title == other_todo.title &&
      description == other_todo.description &&
      done == other_todo.done
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

# puts todo1
# puts todo2
# puts todo3

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.



class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo
    @todos << todo
  end
  alias_method :<<, :add
  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos.clone
  end

  def done?
    @todos.all?(&:done?)
  end

  def item_at(index)
    @todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    # @todos.each(&:done!)
    @todos.each_index{ |index| mark_done_at(index) }
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    @todos.delete(item_at(index))
  end

  def to_s
    # puts "---- Today's Todos ----"
    # @todos.each { |todo| puts todo }
    # ""
    text = "---- Today's Todos ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def each
    # counter = 0
    # while counter < size
    #   yield(item_at(counter))
    #   counter += 1
    # end
    # @todos
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
  #   @todos.select do |todo|
  #     yield(todo)
  #   end
  # end
    new_list = TodoList.new(title)
    each do |todo|
      new_list.add(todo) if yield(todo)
    end
    new_list
  end

  def find_by_title(title)
    select { |todo| todo.title == title }.first
  end

  def all_done
    select(&:done?)
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(title)
    # find_by_title(title) && find_by_title(title).done!
    find_by_title(title)&.done! #checks if object exists before attempting to call method on it

  end

  def mark_all_done
    each(&:done!)
  end

  def mark_all_undone
    each(&:undone!)
  end

end

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# arr = [todo1, todo2, todo3]
# p arr.all?{|todo| todo.done?}

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

list.each do |todo|
  puts todo # calls Todo#to_s
end

todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

puts results

puts list.find_by_title("Buy milk")

puts list.all_done

puts list.all_not_done

puts list.mark_done("Cleansc room")

puts list.mark_all_undone


def call_chunk(code_chunk)
  code_chunk.call
end

color = "blue"
say_color = Proc.new {puts "The color is #{color}"}
call_chunk(say_color)