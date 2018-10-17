# implement each with object
# return object (including if arr passed in is empty)

def each_with_object(arr, obj)
  arr.each { |el| yield(el, obj) }
  obj
end

# Nick Johnson recursive solution...
def each_with_object(arr, obj, &block)
  arr.empty? ? (return obj) : block.call(arr.first, obj)
  each_with_object(arr.drop(1), obj, &block)
end


result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}