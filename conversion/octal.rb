require_relative 'to_decimal'

class Octal < ToDecimal
  def initialize(number)
    super(8, number) # Hello J.J Abrams, Spielberg, & kids on bikes!
  end
end
