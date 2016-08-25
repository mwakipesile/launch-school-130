class ToDecimal
  DIGIT_DICTIONARY = ([*'0'..'9'] + [*'a'..'f']).zip([*0..15]).to_h

  attr_reader :digits, :base

  def initialize(base, number)
    @digits = number.chars.map { |chr| DIGIT_DICTIONARY[chr] }
    @base = base
  end

  def to_decimal
    return 0 unless valid_input?

    digits.reverse.map.with_index do |digit, exponent|
      digit * base**exponent
    end.inject(:+)
  end

  def valid_input?
    digits.all? { |digit| (0...base).cover?(digit) }
  end
end
