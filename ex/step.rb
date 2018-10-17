=begin
write a kind of Range#step but not for range!
input: start, end, step, block
output: block invoked... return start value
(could also return result of final block evaluated, but feel start is
better because predictable and helps ensure the method is used for 
side effects of block only...?)

if not designed for range, then guess first step can't be to convert it?




=end

def step(first, last, step)
  counter = first
  until counter > last
    yield(counter)
    counter += step
  end
  first
end



p step(1, 10, 3) { |value| puts "value = #{value}" }
# value = 1; value = 4; value = 7; value = 10
p step(1, 10, 4) { |value| puts "value = #{value}" }
p step(100, 10, 3) { |value| puts "value = #{value}" }
p step(1, 10, 12) { |value| puts "value = #{value}" }
