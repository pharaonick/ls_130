# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

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

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(item)
    raise TypeError, "Can only add Todo objects" unless item.instance_of?(Todo)
    @todos << item
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

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(idx)
    @todos.delete(item_at(idx))
  end

  def done?
    @todos.all? { |item| item.done? }
  end

  def done!
    @todos.each_index { |idx| mark_done_at(idx) }
  end

  # like this you are outputting when don't necessarily want to
  # -- simply want to return a text rep.
  # def to_s 
  #   puts "---- #{title} ----"
  #   @todos.each { |item| puts item }
  # end

  def to_s
    "---- #{title} ----\n" + @todos.map(&:to_s).join("\n")
  end

  def to_a
    @todos
  end

  def each
    @todos.each { |item| yield(item) }
    self
  end

  # however this returns an array, whereas it should really return an 
  # instance of TodoList...
  # def select
  #   selected = []
  #   each { |item| selected << item if yield(item) }
  #   selected
  # end

  def select
    selected = TodoList.new("Truthy Todos") # could also pass in original `title`
    each { |item| selected << item if yield(item) }
    selected
  end

  # could use `select` and call `first` on it
  def find_by_title(item_title)
    each { |item| return item if item.title.downcase == item_title.downcase }
    nil
  end

  def all_done
    select { |item| item.done? }
  end

  def all_not_done
    select { |item| !item.done? }
  end

  def mark_done(item_title)
    find_by_title(item_title).done! if find_by_title(item_title)
  end

  def mark_all_done
    each { |item| item.done! }
  end

  def mark_all_undone
    each { |item| item.undone! }
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3) 

list.mark_done_at(1)

# puts list

# invoking `TodoList#each`
# list.each { |item| puts item }

# invoking `TodoList#select`
# results = list.select { |item| item.done? }
# puts results.inspect

# EXTRAS...
# p list.find_by_title("buy milk")
# p list.find_by_title("buy mil")

# p list.all_done

# p list.all_not_done

# p list.mark_done('Buy Milk')
# puts list
# p list.mark_done('Buy Mil')
# puts list

# list.mark_all_done
# puts list

# list.mark_all_undone
# puts list






