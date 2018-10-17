# Write a method that takes an optional block. 
# If the block is specified, the method should execute it, 
# and return the value returned by the block. 
# If no block is specified, the method should simply 
# return the String 'Does not compute.'.

# def compute
#   block_given? ? yield : "Does not compute."
# end


# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

# yield argument to block
def compute(arg)
  block_given? ? yield(arg) : "Does not compute."
end

p compute(5) { |x| x + 9 } == 14

p compute('hi') { |x| "#{x} Nick"} == "hi Nick"

p compute('geezer') == "Does not compute."

# NOTE THE ABOVE SHOULD PROLLY USE PARAM NOT ARG...
# ALSO, COULD SPLAT IT `*params`