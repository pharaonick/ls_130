[1, 2, 3].reduce(10) do |acc, num|
  acc + num
end

# => 16

# set default acc starting value to 0
# each iteration, return value of block passed back to acc


def reduce(arr, acc = 0)
  count = 0

  while count < arr.size
    acc = yield(acc, arr[count])
    count += 1
  end

  acc
end


array = [1, 2, 3, 4, 5]

reduce(array) { |acc, num| acc + num }                    # => 15
reduce(array, 10) { |acc, num| acc + num }                # => 25
reduce(array) { |acc, num| acc + num if num.odd? } # => NoMethodError: undefined method `+' for nil:NilClass


# with normal acc default

def reduce(arr, acc = arr[0])
  count = acc == arr[0] ? 1 : 0

  while count < arr.size
    acc = yield(acc, arr[count])
    count += 1
  end

  acc
end





array = [1, 2, 3, 4, 5]

reduce(array) { |acc, num| acc + num }                    # => 15
reduce(array, 10) { |acc, num| acc + num }                # => 25
reduce(array) { |acc, num| acc + num if num.odd? } # => NoMethodError: undefined method `+' for nil:NilClass