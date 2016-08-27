class PhoneNumber
  INVALID_NUMBER = '0000000000'.freeze
  attr_reader :number

  def initialize(number)
    @number = number =~ /[A-Za-z]/ ? INVALID_NUMBER : sanitize(number)
  end

  def sanitize(number)
    number = number.scan(/\d+/).join
    return number if number.size == 10
    return number[1..-1] if number.size == 11 && number[0] == '1'
    INVALID_NUMBER
  end

  def area_code
    number[0, 3]
  end

  def to_s
    "(#{number[0, 3]}) #{number[3, 3]}-#{number[6..-1]}"
  end
end