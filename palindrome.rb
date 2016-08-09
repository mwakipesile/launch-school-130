require 'pry'

class Palindrome
  attr_reader :value, :limits

  def initialize(value, limits)
    @value = value
    @limits = limits
  end

  def factors
    lower_limit = (value.to_f / limits[:max_factor]).ceil
    lower_limit = limits[:min_factor] if lower_limit < limits[:min_factor]
    upper_limit = value / limits[:min_factor]
    upper_limit = limits[:max_factor] if upper_limit > limits[:max_factor]
    factors = []

    while upper_limit > lower_limit
      if value % lower_limit == 0
        factors << [lower_limit, value / lower_limit]
        upper_limit = value / lower_limit
      end
      lower_limit += 1
    end

    factors
  end
end
