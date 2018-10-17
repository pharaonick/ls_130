[1, 2, 3, 4, 5].each do |el|
  puts el * 2
end

=begin
- each element gets passed to block and assigned to block param
- block executed
- continue until iterated through whole collection
- original collection returned

set counter to 0
pass array[counter]
increment counter
end when counter >= array size
=end

def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])
    counter += 1
  end

  array
end

# monkey patching Array for a more realistic example...

class Array
  def my_each
    counter = 0
    while counter < size
      yield(self[counter])
      counter += 1
    end
    self
  end

  # check twgr to see if that uses self somehow...
  def my_map
    results = []
    my_each { |el| results << yield(el) }
    results
  end
end


