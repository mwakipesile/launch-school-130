require 'pry'
class SumOfMultiples

  attr_reader :set

  def initialize(*set)
    @set = set.empty? ? [3, 5] : set
  end

  def self.to(number)
    new.to(number)
  end

  def to(number)
    (0...number).select { |number| multiple?(number) }.inject(:+)
  end

  def multiple?(number)
    set.any? { |factor| number % factor == 0 }
  end
end
