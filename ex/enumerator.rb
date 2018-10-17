=begin
factorial(6)
6*5*4*3*2*1


=end

# WOW YIKES NO YOU WEREN'T SUPPOSED TO IMPLEMENT A 
# SEPARATE FACTORIAL METHOD!
# IT ALL HAPPENS IN THE ENUMERATOR...
# oh, actually, Ian did similar so maybe all is good...!

require 'pry'
require 'pry-byebug'

def factorial(n)
  return 1 if n <= 1
  return 2 if n == 2
  n * factorial(n - 1)
end

# 1, 1, 2, 6, 24, 120, 720...

# the key bit is that you actually are yielding something...

fac = Enumerator.new do |y|
  a = 0
  loop do
    y << factorial(a)
    a += 1
  end
end

# puts fac.take(7)

# (0..6).each do |el|
#   p fac.next
# end

7.times { puts fac.next }

fac.each_with_index do |num, idx|
  puts num
  break if idx >= 6
end


# a 1 2 6 24 
# n 0 2 3 4 5



# factorial = Enumerator.new do |yielder|
#   accumulator = 1
#   number = 0
#   loop do
#     accumulator = number.zero? ? 1 : accumulator * number
#     yielder << accumulator
#     number += 1
#   end
# end

# 7.times { puts factorial.next }

# factorial.rewind

# factorial.each_with_index do |number, index|
#   puts number
#   break if index == 6
# end


# the student solutions are great too