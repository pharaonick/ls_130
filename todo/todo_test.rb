require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todo_final_clean'

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

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  # def test_shift
  #   assert_equal(@todo1, @list.shift)
  #   assert_equal(@todo2, @list.first)
  # end

  # LS VERSION
  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  # def test_done?
  #   assert_equal(@todos.all? { |todo| todo.done? }, @list.done?)
  # end

  # LS expresses differently because we know all the todos here are not done...
  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_typeerror
    assert_raises(TypeError) { @list.add('bob') }
    assert_raises(TypeError) { @list.add(10) }
  end

  # def test_shovel
  #   @todo4 = Todo.new("Test test")
  #   # assert_equal(@todos << @todo4, @list << @todo4)
  #   assert_equal([@todo1, @todo2, @todo3, @todo4], @list << @todo4)
  # end

  # BEST NOT TO CREATE NEW INSTANCE VARIABLE... KEEP IT CLEANER:
  def test_shovel
    new_todo = Todo.new("Test test")
    @todos << new_todo
    @list << new_todo

    assert_equal(@todos, @list.to_a)
  end

  # def test_add_alias
  #   new_todo = Todo.new("Test test")
    
  #   assert_equal(@list << new_todo, @list.add(new_todo))
  # end

  # LS version that doesn't rely on shovel working...
  def test_add_alias
    new_todo = Todo.new('new todo')
    @list.add(new_todo)
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  # def test_item_at
  #   assert_equal(@todos.fetch(1), @list.item_at(1))
  #   # assert_equal(@todos.fetch(10), @list.item_at(10))
  #   assert_raises(IndexError) { @list.item_at(10) }
  # end

  # AGAIN, BEST TO BE SPECIFIC...
  def test_item_at
    assert_raises(IndexError) { @list.item_at(100) }
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo3, @list.item_at(2))
  end

end














