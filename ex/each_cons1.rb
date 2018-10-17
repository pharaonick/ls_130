=begin
Enumerable#each_cons -- iterates over collection by passing n consecutive
els at a time to the block. Returns nil.

Write version that takes an array as arg & yields consecutive pairs to block...
=end


# this can be refactored slightly... think about how inject block return works...
def each_cons(arr)
  arr.inject do |first, second|
    yield(first, second)
    first = second
  end
  nil
end

# LS solution uses each_with_index to figure out when to stop iterating
# many variations on the above :)

# Bernard has very clever solution using `Integer#times` and `Array#drop` + `Array#take`...


hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}

hash = {}
each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}