# reconstruct array#zip...
# input: two arrays of same length
# output: new zipped array 

def zip(arr1, arr2)
  zipped = []
  arr1.each_with_index do |el, i|
    zipped << [el, arr2[i]]
  end
  zipped
end

# yes it can be done using `with_object`
def zip(arr1, arr2)
  arr1.each_with_index.with_object([]) do |(el, i), z|
    z << [el, arr2[i]]
  end
end

# and in fact of course it's just a simple loop where we track index...
# and where because the arrays are the same lenght there's only one index to track
def zip(arr1, arr2)
  index = 0
  zipped = []
  while index < arr1.length
    zipped << [arr1[index], arr2[index]]
    index += 1
  end
  zipped
end

# CAN ALSO USE MAP (BECAUSE WANT NEW ARRAY) AND THERE'S A 
# SUPER SEXY SHORT VERSION USING SHIFT...

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
p zip(['a', 'hi', 7], [0, 5, 'deadly sins']) == [['a', 0], ['hi', 5], [7, 'deadly sins']]
