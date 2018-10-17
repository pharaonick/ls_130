# count but for bunch of arguments not necessarily an array
def count(*args)
  args.each_with_object([]) { |el, arr| arr << el if yield(el) }.size
end

# prolly better to just implement a counter so we aren't chucking the els around

def count(*args)
  count = 0
  args.each { |el| count += 1 if yield(el) }
  count
end

count(1, 3, 6) { |value| value.odd? } == 2
count(1, 3, 6) { |value| value.even? } == 1
count(1, 3, 6) { |value| value > 6 } == 0
count(1, 3, 6) { |value| true } == 3
count() { |value| true } == 0
count(1, 3, 6) { |value| value - 6 } == 3