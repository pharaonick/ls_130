require 'simplecov'
SimpleCov.start

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

  def test_shift
    shifted = @list.shift
    assert_equal(@todo1, shifted)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    popped = @list.pop
    assert_equal(@todo3, popped)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_error
    assert_raises(TypeError) { @list.add('bob') }
    assert_raises(TypeError) { @list.add(4) }
  end

  def test_shovel
    new_todo = Todo.new('do this')
    assert_equal(@list << new_todo, [@todo1, @todo2, @todo3, new_todo])
  end

  def test_add_alias
    new_todo = Todo.new('do this')
    assert_equal(@list.add(new_todo), @list << new_todo)
  end

  # LS writes the above as
  def test_add_alias
    new_todo = Todo.new("Feed the cat")
    @list.add(new_todo)
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_equal(@todos[0], @list.item_at(0))
    assert_raises(IndexError) { @list.item_at(5) }
  end

  # hmmmm see undone test for how this prolly should have worked
  def test_mark_done_at
    assert_equal(@todos[0].done!, @list.mark_done_at(0))
    assert_raises(IndexError) { @list.mark_done_at(100) }
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    
    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(0)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    @list.remove_at(0)
    assert_equal([@todo2, @todo3], @list.to_a)
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

  # using oldskool HEREDOC where need to get rid of preceding spaces
  def test_to_s_oldskool
    output = <<-OUTPUT.chomp.gsub(/^\s+/, '')
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_one_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(0)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    array = []
    @list.each { |todo| array << todo }
    assert_equal([@todo1, @todo2, @todo3], array)
  end  

  def test_each_return
    return_obj = @list.each { |todo| puts todo }
    assert_instance_of(TodoList, return_obj)
  end
  # LS does as:
  # def test_each_returns_original_ist
  #   assert_equal(@list, @list.each {|todo| nil })
  # end

  def test_select
    selected = @list.select { |todo| todo.title == "Buy milk" }
    assert_equal([@todo1], selected.to_a)
    assert_instance_of(TodoList, selected)
  end
  # LS does as:
  # def test_select
  #   @todo1.done!
  #   list = TodoList.new(@list.title)
  #   list.add(@todo1)

  #   assert_equal(list.title, @list.title)
  #   assert_equal(list.to_s, @list.select{ |todo| todo.done? }.to_s)
  # end

  # GOING FOR 100% COVERAGE!!
  def test_find_by_title
    target_todo = @list.find_by_title("Buy milk")
    assert_equal(@todo1, target_todo)
  end

  def test_all_done
    @todo1.done!
    @todo2.done!

    all_done = @list.all_done 
    assert_equal([@todo1, @todo2], all_done.to_a)
  end

  def test_all_not_done
    @todo1.done!
    @todo2.done!

    not_done = @list.all_not_done
    assert_equal([@todo3], not_done.to_a)
  end

  def test_mark_done
    @todo1.done!

    one_marked_done = @list.mark_done("Buy milk")
    assert_equal(@todo1.to_s, @list.first.to_s)
  end

  def test_mark_all_done
    @todo1.done!
    @todo2.done!
    @todo3.done!

    all_done = @list.mark_all_done
    assert_equal([@todo1, @todo2, @todo3], @list.to_a)
  end

  def test_mark_all_undone
    @todo1.done!
    @todo2.done!
    @todo3.done!

    assert_equal(false, @list.mark_all_undone.done?)
  end
end