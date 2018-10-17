items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# NOTE LS SOLUTION GAVE BLOCK PARAM NAMES TO MATCH EL

# NOTE YOU COULD ALSO ACHIEVE THE SAME THING BY MODIFYING GATHER METHOD FOR
# EACH EXAMPLE AND INVOKING GATHER WITH SPLAT -- PASSING IN EACH ARRAY EL RATHER
# THEN ALL ELS BUNDLED TOGETHER INTO AN ARRAY.
# OBV MUCH LESS EFFICIENT THAN USING BLOCK...

###1
gather(items) do |*first, last|
  puts first.join(', ')
  puts last
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!


###2
gather(items) do |first, *middle, last|
  puts first
  puts middle.join(', ')
  puts last
end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!


###3
gather(items) do |first, *last|
  puts first
  puts last.join(', ')
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!


###4
gather(items) do |el1, el2, el3, el4|
  puts "#{el1}, #{el2}, #{el3}, #{el4}"
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!