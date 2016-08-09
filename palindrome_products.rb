require 'pry'
require_relative 'palindrome'

class Palindromes
  attr_accessor :palindromes
  attr_reader :limits

  def initialize(limits)
    limits[:min_factor] ||= 1
    @limits = limits
    @palindromes = []
  end

  def generate
    self.palindromes = palindrome_values.map do |value|
                        Palindrome.new(value, limits)
                      end
  end

  def largest
    palindromes.last
  end

  def smallest
    palindromes.first
  end

  private

  def palindrome_values
    [*limits[:min_factor]..limits[:max_factor]]
    .repeated_combination(2).to_a.collect do |pair|
  		 prod = pair.inject(:*)
  		 prod if palindrome?(prod)
  	end.compact.sort
	end

  def palindrome?(number)
    number.to_s.reverse == number.to_s
  end
end



