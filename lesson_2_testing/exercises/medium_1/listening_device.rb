# - Listen for something, and if anything is said, record it for later use. If nothing is said, then do not record anything.

# - Anything that is said is retrieved by this listening device via a block. If nothing is said, then no block will be passed in. The listening device can also output the most recent recording using a Device#play method.



class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    record(yield) if block_given?
  end

  def play
    puts @recordings.last
    # return unless block_given?
    # recording = yield
    # record(recording)
  end
end


listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"