# input - array
#       - block that returns true/false depending on element passed to it
# output - count of number of true returns
# can't use #count

# def count(arr)
#   counter = 0
#   arr.each { |el| counter += 1 if yield(el) }
#   counter
# end

# def count(arr)
#   arr.each_with_object([]) { |el, counter| counter << el if yield(el) }.size
# end

# without using each, loop, while, until... (will also discard each_with_obj)
def count(arr)
  arr.select { |el| yield(el) }.size
end

# sachin's recursive solution is very clever!

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2