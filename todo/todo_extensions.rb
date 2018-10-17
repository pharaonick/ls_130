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

  # def each
  #   counter = 0

  #   while counter < size
  #     yield(item_at(counter))
  #     counter += 1
  #   end

  #   to_a # not specified what we should return, so...
  # end

  # can make is simpler, esp. since `@todos` refs an array...
  def each
    @todos.each do |item|
      yield(item)
    end

    self ## return original object **********
  end

  # ok this is getting kind of inception in terms of our yielding??!
  # PLUS we aren't returning an object of the calling class ********
  # def select
  #   selected = []

  #   each do |item|
  #     selected << item if yield(item)
  #   end

  #   selected
  # end

  def select
    selected = TodoList.new(title) # ****** TITLE GETTER!

    each do |item|
      selected << item if yield(item)
    end

    selected
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

# list.each do |todo|
#   puts todo                   # calls Todo#to_s
# end

todo1.done!
results = list.select { |todo| todo.done? }
puts results.inspect