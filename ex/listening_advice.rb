=begin
should listen for something
if anything said, record for later
  - retrieved via block
if nothing said, do not record anything
  - no block passed in

can output what was recorded via Device#play

=end

class Device
  def initialize
    @recordings = []
  end

  def listen
    record(yield) if block_given?
  end

  def record(recording)
    @recordings << recording
  end

  def play
    puts @recordings.last
  end
end



listener = Device.new
# listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"