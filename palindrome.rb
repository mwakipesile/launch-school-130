require 'pry'

class Palindrome
  attr_reader :limits
  attr_accessor :value, :factors

  def initialize(limits)
    @limits = limits
  end

  def generate
    largest_number = limits[:max_factor]**2
    smallest_number = limits[:min_factor]**2

    largest_number.downto(smallest_number) do |number|
      next unless palindrome?(number)
      unless get_factors(number).empty?
        self.value = number
        break
      end
    end
  end

  def get_factors(palindrome)
    lower_limit = (palindrome.to_f / limits[:max_factor]).ceil
    lower_limit = limits[:min_factor] if lower_limit < limits[:min_factor]
    upper_limit = palindrome / limits[:min_factor]
    upper_limit = limits[:max_factor] if upper_limit > limits[:max_factor]
    factors = []

    while upper_limit > lower_limit
    	if palindrome % lower_limit == 0
    		factors << [lower_limit, palindrome / lower_limit]
    		upper_limit = palindrome / lower_limit
    	end
    	lower_limit += 1
    end

    self.factors = factors
  end

  def palindrome?(number)
    number.to_s.chars.reverse == number.to_s.chars
  end
end

class LargestPalindrome < Palindrome
end

class SmallestPalindrome < Palindrome
  def generate
    largest_number = limits[:max_factor]**2
    smallest_number = limits[:min_factor]**2

    (smallest_number..largest_number). each do |number|
      next unless palindrome?(number)
      unless get_factors(number).empty?
        self.value = number
        break
      end
    end
  end
end
