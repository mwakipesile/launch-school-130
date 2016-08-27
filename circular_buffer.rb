class CircularBuffer
  BufferEmptyException = 'The buffer is empty'
  BufferFullException = 'The buffer is full'

  attr_reader :buffer, :size

  def initialize(size)
    @size = size
    @buffer = []
  end

  def read
    raise BufferEmptyException if buffer.empty?
    buffer.shift
  end

  def write(element)
    raise BufferFullException if buffer.size == size
    buffer << element unless element.nil?
  end

  def write!(element)
    buffer << element unless element.nil?
    buffer.shift(buffer.size - size) if buffer.size > size
  end

  def clear
    raise BufferEmptyException if buffer.empty?
    buffer.clear
  end
end
