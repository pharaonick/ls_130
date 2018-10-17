# Write a method that returns a list of all of the divisors 
# of the positive integer passed in as an argument. 
# The return value can be in any sequence you wish.

=begin
from 1 up to arg
add num to array if arg % num == 0
  
=end

# def divisors(int)
#   (1..int).each_with_object([]) { |i, arr| arr << i if int % i == 0 }
# end

# select is better!
# def divisors(int)
#   (1..int).select { |i| int % i == 0 }
# end

# optimize by only brute-forcing half the numbers...
# iterate up to half way only
# every time there's a hit, add its mirror: int / hit

# lol NO
def divisors(int)
  divs = [1]
  (1..int/2).each do |i|
    if int % i == 0
      divs << i unless divs.include?(i)
      divs << (int / i) unless divs.include?(int / i)
    end
  end
  divs
end

# TRY TO GROK THE SQUARE ROOT THING...
# ZAC'S SOLUTION MAKES SENSE I THINK...!



p divisors(999962000357)
# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) #== [1, 9967, 9973, 99400891] # may take a minute

