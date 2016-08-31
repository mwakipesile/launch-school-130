require 'pry'
require_relative 'element'

class SimpleLinkedList
  attr_reader :list

  def initialize
    @list = []
  end

  def size
    list.size
  end

  def empty?
    list.empty?
  end

  def push(datum)
    list << Element.new(datum, head)
  end

  def head
    list.last
  end

  def peek
    head.datum if head
  end

  def pop
    list.pop.datum
  end

  def self.from_a(array)
    return new unless array.is_a?(Array)
    array.reverse.each_with_object(new) { |datum, list| list.push(datum) }
  end

  def to_a
    list.map { |element| element.datum }.reverse
  end

  def reverse
    self.class.from_a(to_a.reverse)
  end
end