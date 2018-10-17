# implement each with index...


# `each` already returns original collection, so that takes care of that!
def each_with_index(arr)
  arr.each { |el| yield(el, arr.index(el)) }
end

# Nick Johnson has an interesting recursive solution...

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]