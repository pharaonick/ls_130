=begin
Enumerable#max_by iterates over collection, passing each el to block
returns el for which block returned largest value
return nil if collection empty

- iterate through collection passing each el to block
- calc block return value
- save index of element if block return value higher than current one


=end

# this is actually really convoluted... you can make it a lot simpler as long
# as you are willing to duplicate the first iteration... :)

def max_by(collection)
  return nil if collection.empty?

  largest_return = [yield(collection.first), 0]
  collection.each_with_index do |el, i|
    next if i == 0
    largest_return = [yield(el), i] if yield(el) > largest_return.first
  end
  
  collection[largest_return.last]
end

# there is actually an amazing `inject` one-liner... try to figure out!!

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil