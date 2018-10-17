def select(array)
  selected = []
  counter = 0

  while counter < array.size
    result = yield(array[counter])
    selected << array[counter] if result
    counter +=1
  end

  selected
end

# refactor -- can directly use the yield return
# (note could also add a local var to track current el if wanted)

def select(array)
  selected = []
  counter = 0

  while counter < array.size
    selected << array[counter] if yield(array[counter])
    counter +=1
  end

  selected
end