=begin
input - array, pass to block -- ignore first two els, group rest as 'raptors' array
output - not sure, original array?
=end

def raptor_splat(arr)
  yield(arr)
end

birds = %w(raven finch hawk eagle osprey)

raptor_splat birds do |el1, el2, *raptors|
  puts "Raptors: #{raptors.join(', ')}."
  end

# THE FIRST TWO PARAMS SHOULD BE _