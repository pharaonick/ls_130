# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc # #<Proc:0x00007ffa8a908760@blocks_procs_lambdas.rb:2>
# puts my_proc.class # Proc
# my_proc.call # "This is a ."
# my_proc.call('cat') # "This is a cat."
=begin
- one way to create: `proc_name = proc { |param| ... }`
  - also `proc_name = Proc.new { |param| ... }`
- a proc is an instance of Proc
- output of proc object and its class as expected.
- proc is invoked via `Proc#call`
- relaxed arity - invoking proc without necessary block argument sets block arg to `nil`
  (can demo this by changing above proc to `p thing`)
  - additional args ignored?
=end

# # Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}" }
# my_second_lambda = -> (thing) { puts "This is a #{thing}" }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class # Proc
# my_lambda.call('dog')
# my_lambda.call # fatal error -- ArgumentError
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" } # NameError uninitialized constant Lambda
=begin
- lambda is another type of Proc
- can create by: 
  - `lambda_name = lambda { |param| ... }`
  - `lambda_name = -> (param) { ... }`
- strict arity -- invoking without the required block param -> fatal error
  - ditto invoking with too many args
- no Lambda class so cannot create via `Lambda.new`
=end


# # Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."} # "This is a ."
# block_method_1('seal') # LocalJumpError
=begin
- invoking a method that yields execution to a block without providing it with
a block -> LocalJumpError
- method arguments must be explicitly yielded to the block
- blocks have relaxed arity, setting block args to `nil` if no value passed in
=end

# # Group 4
# def block_method_2(animal)
#   yield(animal)
# end

# block_method_2('turtle') { |turtle| puts "This is a #{turtle}."} # "This is a turtle."
# block_method_2('turtle') do |turtle, seal|
#   puts "This is a #{turtle} and a #{seal}." # "This is a turtle and a ."
# end
# block_method_2('turtle') { puts "This is a #{animal}."} # NameError undefined local variable or method 'animal'
=begin
- if a single method element is yielded to the block and you invoke the block
  - with two block params, the second is set to `nil`
  - with no block params, you get a NameMethod error if an otherwise out-of-scope
    variable is referenced (and don't forget that method args are out of scope 
    unless passed in when yielding and initialized as a block param
    (loose terminology here...!)

# NB compare...

creature = 'scary creature'

def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { puts "This is a #{creature}."}

# with...

animal = 'scary creature'

def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |animal| puts "This is a #{animal}."}
=end

# overall summary...
=begin
- procs and lambdas are Proc objects; blocks are not an object 
  - (they are part of method invocation syntax? sometimes simplified as implicit method argument?)
- creating proc
  - my_proc = proc { |param| code }
  - my_proc = Proc.new { |param| code }
- creating lambda
  - my_lambda = lambda { |param| code }
  - my_lambda = -> (param) { code }
  - no Lambda class so cannot be instantiated
- creating blocks
  - created on fly as part of method invocation { |param| code }
- invoking procs and lambdas: Proc#call
- invoking blocks: yield within method implementation, passing args as appropriate
- procs and blocks have relaxed arity, ignoring extra block params assigning missing ones to nil
- lambdas have strict arity -- invoking it without correct num args -> ArgErr
- blocks -> LocalJumpError if method that yields to block is invoked without one 
  - (unless use control flow like block_given?)
=end

# LS DESCRIPTION...
=begin
Group 1:

    A new Proc object can be created with a call of proc instead of Proc.new
    A Proc is an object of class Proc
    A Proc object does not require that the correct number of arguments are passed to it. If nothing is passed, then nil is assigned to the block variable.

Group 2

    A new Lambda object can be created with a call to lambda or ->. We cannot create a new Lambda object with Lambda.new
    A Lambda is actually a different variety of Proc.
    While a Lambda is a Proc, it maintains a separate identity from a plain Proc. This can be seen when displaying a Lambda: the string displayed contains an extra "(lambda)" that is not present for regular Procs.
    A lambda enforces the number of arguments. If the expected number of arguments are not passed to it, then an error is thrown.

Group 3

    A block passed to a method does not require the correct number of arguments. If a block variable is defined, and no value is passed to it, then nil will be assigned to that block variable.
    If we have a yield and no block is passed, then an error is thrown.

Group 4

    If we pass too few arguments to a block, then the remaining ones are assigned a nil value.
    Blocks will throw an error if a variable is referenced that doesn't exist in the block's scope.

Comparison

    Lambdas are types of Proc's. Technically they are both Proc objects. An implicit block is a grouping of code, a type of closure, it is not an Object.
    Lambdas enforce the number of arguments passed to them. Implicit block and Procs do not enforce the number of arguments passed in.

=end

