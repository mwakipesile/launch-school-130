require 'pry'
require_relative 'palindrome'

class Palindromes
  attr_reader :palindrome, :largest, :smallest

  def initialize(limits)
    limits[:min_factor] ||= 1
    @largest = LargestPalindrome.new(limits)
    @smallest = SmallestPalindrome.new(limits)
  end

  def generate
    largest.generate
    smallest.generate
  end
end



