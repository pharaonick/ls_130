# Adding & operator to object containing method calls `Method#to_proc`

# def convert_to_base_8(n)
#   n.method_name.method_name # replace these two method calls
# end

# # The correct type of argument must be used below
# base8_proc = method(argument).to_proc

# # We'll need a Proc object to make this code work. Replace `a_proc`
# # with the correct object
# [8,10,12,14,16,33].map(&a_proc) == [10, 12, 14, 16, 20, 41]

# =begin
# call map on array with proc arg that converts base10 num to base8

# =end

#ah you cheated by using an extra method! Should have been Integer#to_s(8).to_i
def convert_to_base_8(n)
  n.divmod(8).join.to_i
end

base8_proc = method(:convert_to_base_8).to_proc

p [8,10,12,14,16,33].map(&base8_proc) == [10, 12, 14, 16, 20, 41]

# OH WOW NOTE YOU CAN ACTUALLY DO THIS...
[8,10,12,14,16,33].map(&method(:convert_to_base_8))
# - will convert the convert_to_base_8 method to a proc for us, and then to a block!