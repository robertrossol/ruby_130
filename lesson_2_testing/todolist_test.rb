require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todo'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_same(@todo1, @list.first)
    # assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_same(@todo3, @list.last)
    # assert_equal(@todo3, @list.last)
  end

  def test_shift
    # todo = @list.shift
    # assert_equal(@todo1, todo)
    assert_same(@todo1, @list.shift)
    assert_equal(2, @list.size)
    assert_equal([@todo2, @todo3], @list.to_a)
    # assert_same(@todo2, @list.first)
    # assert_same(@todo3, @list.last)
  end

  def test_pop
    todo = @list.pop
    assert_same(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError){ @list.add("hi") }
    assert_raises(TypeError){ @list.add(1) }
  end

  def test_add
    todo4 = Todo.new("Do Something")
    @todos << todo4
    @list.add(todo4)
    assert_equal(@todos, @list.to_a)
  end

  def test_shovel
    todo4 = Todo.new("Do Something")
    @todos << todo4
    @list << todo4
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(50) }
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(50) }
    @list.mark_done_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_done_at(50) }
    # @list.mark_all_done
    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(2)

    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_done!
    @list.done!

    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.mark_done_at(50) }
    assert_equal(@todo2, @list.remove_at(1))
    assert_equal(2, @list.size)
    assert_equal([@todo1, @todo3], @list.to_a)

    # @list.remove_at(1)
    # assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
      ---- Today's Todos ----
      [ ] Buy milk
      [ ] Clean room
      [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_2
    output = <<~OUTPUT.chomp
      ---- Today's Todos ----
      [ ] Buy milk
      [X] Clean room
      [ ] Go to gym
    OUTPUT

    @list.mark_done_at(1)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_3
    output = <<~OUTPUT.chomp
      ---- Today's Todos ----
      [X] Buy milk
      [X] Clean room
      [X] Go to gym
    OUTPUT

    @list.done! #@list.mark_all_done
    assert_equal(output, @list.to_s)
  end

  def test_each
    result = []
    @list.each { |todo| result << todo }
    assert_equal(@todos, result)
  end

  def test_each_returns_original_list
    # result = @list.each { |todo| nil }
    assert_equal(@list, @list.each { |todo| nil })
  end

  def test_select
    assert_equal(@list.select(&:done?).to_a, [])
    @todo2.done!
    assert_equal(@list.select(&:done?).to_a, [@todo2])
  end

  def test_select_2
    @todo2.done!
    list = TodoList.new(@list.title)
    list.add(@todo2)

    assert_equal(list.title, @list.title)
    assert_equal(list.to_s, @list.select(&:done?).to_s)
  end
end