# iterate over collection passing each el to block
# return new array consisting of all arguments following those
# at the beginning that return a truthy value...!

def drop_while(collection)
  collection.each_with_object([]) do |el, arr|
    next if yield(el) && arr.empty?
    arr << el
  end
end

# LS solution may be better because actually stops iterating and simply slices
def drop_while(collection)
  index = 0
  while index < collection.size && yield(collection[index])
    index += 1
  end
  collection[index..-1]
end

# clever reduce solution from Pete Seifi that uses the collection as the 
# memo and drops each element as it proves to return true

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []