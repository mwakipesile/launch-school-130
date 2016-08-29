# Binary Search Tree class
class Bst
  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
  end

  def insert(new_data)
    new_data > data ? insert_right(new_data) : insert_left(new_data)
  end

  def each
    return data_enumerator unless block_given?

    left.each { |data| yield(data) } if left
    yield(data)
    right.each { |data| yield(data) } if right
  end

  private

  attr_writer :data, :left, :right

  def insert_left(data)
    left ? left.insert(data) : self.left = self.class.new(data)
  end

  def insert_right(data)
    right ? right.insert(data) : self.right = self.class.new(data)
  end

  def data_enumerator
    enum = []
    left.each { |data| enum << data } if left
    enum << data
    right.each { |data| enum << data } if right
    enum.each
  end
end
