class ToDecimal
  DIGIT_DICTIONARY = ([*'0'..'9'] + [*'a'..'f']).zip([*0..15]).to_h

  attr_reader :digits, :base, :max_digit

  def initialize(base, number)
    @digits = number.chars.map { |chr| DIGIT_DICTIONARY[chr] }
    @base = base
    @max_digit = base - 1
  end

  def to_decimal
    return 0 if invalid_input?

    digits.reverse.map.with_index do |digit, exponent|
      digit * base**exponent
    end.inject(:+)
  end

  def invalid_input?
    digits.any? { |digit| !digit || digit < 0 || digit > max_digit }
  end
end
