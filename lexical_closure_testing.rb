# based off https://launchschool.com/posts/49ed1d7c

p self.private_methods.include? :my_method #=> false

test_proc = proc do
  puts "my lexical scope is #{self.class} class!"
  puts "Does closure have access to 'my_method'? #{self.private_methods.include? :my_method }"
end

def my_method; end
test_proc.call()

