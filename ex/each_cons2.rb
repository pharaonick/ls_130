# update previous so takes an argument specifying how many els to handle at once

=begin
n = length of cons
pass arr[i..i+n] to block
break if i+n >= arr.length
=end

# RATHER JANKY...
# def each_cons(arr, n)
#   idx_adjuster = n - 1
#   arr.each_with_index do |el, i|
#     break if i + idx_adjuster >= arr.length
#     if n == 1
#       yield(el)
#     else
#       yield(arr[i..i + idx_adjuster])
#     end
#   end
#   nil
# end


# note this may only work because of the specific way the test cases have
# been set up? Because I'm actually only passing one arg, an array...
# Not sure tbh...
def each_cons(arr, n)
  arr.each_with_index do |el, i|
    break if i + n > arr.length
    n == 1 ? yield(el) : yield(arr[i...i + n])
  end
  # nil
end

# tons of ways to do it once you realize about the splat...
# note the LS solution uses each_index ...

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}