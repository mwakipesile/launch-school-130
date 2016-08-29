require 'pry'
# Binary Search Tree class
class Bst
  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
  end

  def insert(new_data)
    branch = new_data > data ? :right : :left
    if send(branch)
      send(branch).insert(new_data)
    else
      send("#{branch}=", self.class.new(new_data))
    end
  end

  def each
    return to_enum unless block_given?

    left.each { |data| yield(data) } if left
    yield(data)
    right.each { |data| yield(data) } if right
  end

  private

  attr_writer :data, :left, :right
end

# Alternative each (yield part)
# left.each(&block) if left
# yield(data)
# right.each(&block) if right
