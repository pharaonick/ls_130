=begin
Write a method that takes a sorted array of integers as an argument, 
and returns an array that includes all of the missing integers 
(in order) between the first and last elements of the argument.

input: sorted array of ints
  - if less than two ints, return empty array
output: new array of all the missing ints
  - if none missing, array is empty


set counter to first+1
iterate up to last-1
push counter to new array if not included in original array

=end

# COME UP WITH A MUCH MORE IDIOMATIC SOLUTION! E.G. USING SELECT...
# (or delete_if, or... )

def missing(arr)
  missing_integers = []
  counter = arr.first + 1
  counter.upto(arr.last - 1) do |c|
    missing_integers << c unless arr.include?(c)
  end
  missing_integers
end

# somewhat absurd LS solution...
def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end
# takes each pair of nums in the array, 
# turns the numbers between them into an array,
# concats that array with result

# solve without method that takes block...?
# can use array subtraction...


p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []