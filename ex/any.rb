# input: array, block
# output: true if block returns true for any element, false otherwise
#         stop processing as soon as true returned
#         empty array -> false

def any?(arr)
  arr.each { |el| return true if yield(el) }
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false

# with hash...
p any?({a: 1, b: 2, c: 3, d: 4}) { |pair| pair.include?(9) }
p any?({a: 1, b: 2, c: 3, d: 4}) { |pair| pair.include?(2) }
p any?({a: 1, b: 2, c: 3, d: 4}) { |k, v| k == :a }
p any?({a: 1, b: 2, c: 3, d: 4}) { |k, v| k == :i }