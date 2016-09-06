class Fixnum
  DICTIONARY = [
    { 1 => 'I', 5 => 'V' }, { 1 => 'X', 5 => 'L' },
    { 1 => 'C', 5 => 'D' }, { 1 => 'M', 5 => '' }
  ].freeze

  def to_roman
    to_s.reverse.chars.map.with_index do |digit, idx|
      roman_digit(digit.to_i, idx)
    end.reverse.join
  end

  def roman_digit(digit, place)
    return DICTIONARY[place][1] + DICTIONARY[place + 1][1] if digit == 9
    return DICTIONARY[place][1] + DICTIONARY[place][5] if digit == 4
    DICTIONARY[place][5] * (digit / 5) << DICTIONARY[place][1] * (digit % 5)
  end
end
