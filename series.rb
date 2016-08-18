class Series
  attr_reader :number_string, :size

  def initialize(number_string)
    @number_string = number_string
    @size = number_string.size
  end

  def slices(length)
    raise ArgumentError if size < length

    (0..(size - length)).each.with_object([]) do |i, a|
      a << number_string.slice(i, length).split('').map(&:to_i)
    end
  end
end
