class Array
  # def my_each
  #   counter = 0
  #   self.size.times do # however, this is using a different built-in method...
  #     yield(self[counter])
  #     counter += 1
  #   end
  #   self
  # end

  def my_each
    counter = 0
    while counter < self.size
      yield(self[counter])
      counter += 1
    end
    self
  end

  def my_select_from_scratch
    result = []
    counter = 0
    self.size.times do # ditto above comment...
      result << self[counter] if yield(self[counter])
      counter += 1
    end
    result
  end

  def piggyback_select
    result = []
    self.my_each { |el| result << el if yield(el) }
    result
  end

  def my_map_from_scratch
    result = []
    counter = 0
    while counter < self.size
      result << yield(self[counter])
      counter += 1
    end
    result
  end

  def piggyback_map
    result = []
    self.my_each { |el| result << yield(el) }
    result
  end

  def my_reduce_from_scratch(acc = self.first)
    counter = acc == self.first ? 1 : 0
    while counter < self.size
      acc = yield(acc, self[counter])
      counter += 1
    end
    acc
  end

  def piggyback_reduce(acc = self.first)
    # actually this is prolly quite tricky because of the 
    # default acc thing...
  end
end

# p [1, 2, 3, 4, 5].piggyback_map { |el| el ** 2 }

[1, 2, 3, 4, 5].my_each { |el| p el * 2 }


# here is a very sexy reduce...
def reduce(array, default=nil)
  index, accumulator = default ? [0, default] : [1, array.first]

  while index < array.size
    accumulator = yield(accumulator, array[index])
    index += 1
  end

  accumulator
end


class Integer
  def my_times
    counter = 0
    while counter < self
      yield(counter) # if we don't pass `counter` to the block then there is no block param we can make use of
      counter += 1
    end
    self
  end
end