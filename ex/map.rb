# basically implement map

def map(arr)
  arr.each_with_object([]) { |el, mapped| mapped << yield(el) }
end


p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

p map({a: 1, b: 2, c: 3, d: 4}) { |k, v| "#{k}: #{v**2}" }