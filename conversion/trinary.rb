require_relative 'to_decimal'

class Trinary < ToDecimal
  def initialize(number)
    super(3, number)
  end
end

