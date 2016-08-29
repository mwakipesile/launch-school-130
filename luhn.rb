require 'pry'
class Luhn
  attr_accessor :number, :addends

  def initialize(number)
    @number = number
    @addends = derive_addends
  end

  def derive_addends
    addends = []
    idx = 0

    until number == 0
      addend = number % 10

      addends.unshift(addend) if idx.even?
      addends.unshift(addend > 4 ? addend * 2 - 9 : addend * 2) if idx.odd?

      self.number /= 10
      idx += 1
    end

    addends
  end

  def checksum
    addends.inject(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(number)
    number *= 10
    luhn = new(number)
    return number if luhn.valid?

    number + 10 - luhn.checksum % 10
  end
end
