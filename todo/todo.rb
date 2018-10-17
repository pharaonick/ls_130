class Todo
  DONE_MARKER = 'X'
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
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def validate_item_type(item)
    raise TypeError.new("Can only add Todo objects.") unless item.is_a?(Todo)
  end

  def add(todo_item)
    begin
      validate_item_type(todo_item)
      @todos << todo_item
    rescue => e 
      puts e.message # not sure we need to call `message here?`
    end
  end

  # ^ overly complex...
  def add(todo_item)
    raise TypeError, "Can only add Todo objects" unless todo_item.instance_of?(Todo)
    @todos << todo_item
  end

  # plus can alias:
  alias_method :new_add, :add

  def <<(todo_item)
    begin
      validate_item_type(todo_item)
      @todos << todo_item
    rescue => e
      puts e.message
    end
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    @todos.fetch(idx).done!
  end

  def mark_undone_at(idx)
    @todos.fetch(idx).undone!
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(idx)
    if @todos.delete_at(idx).nil?
      raise IndexError.new
    else
      @todos.delete_at(idx)
    end
  end

  # ^ too complex... make use of the `item_at` method...
  # plus you can use delete because it's removing all occurrences of that
  # OBJECT not simply objects with that title!!!!!!!!!
  def remove_at(idx)
    @todos.delete(item_at(idx))
  end

  def to_s
    output = "---- #{title} ----\n"
    @todos.each { |todo| output += "#{todo}\n" }
    output
  end

  # sexier way to do the iteration:
  # output << @todos.map(&to_s).join("\n")
end


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

# puts todo1
# puts todo2
# todo3.done!
# puts todo3

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)
# list.add(1)
# puts list.size
# puts list.first
# puts list.last
# list.mark_done_at(1)
# list.mark_undone_at(1)
# p list
list.mark_done_at(1)
puts list


######## LS solution #######

class Todo
  DONE_MARKER = 'X'
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
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def <<(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo

    @todos << todo
  end
  alias_method :add, :<<

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    @todos.each_index do |idx|
      mark_done_at(idx)
    end
  end

  def remove_at(idx)
    @todos.delete(item_at(idx))
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def to_a
    @todos
  end
end


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
todo4 = Todo.new("Clean room")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)
list.add(todo4)