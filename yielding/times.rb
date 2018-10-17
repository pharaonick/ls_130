# 5.times do |n|
#   puts n
# end
# # 0, 1, 2, 3, 4
# # => 5

# performing x iterations, and for each iteration passing the counter to the block
# then returning the original arg

def times(num)
  counter = 0

  while counter < num
    yield(counter)
    counter += 1
  end

  num
end