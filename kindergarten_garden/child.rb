class Child
  COlUMNS_PER_ROW = 2

  attr_reader :name, :children

  def initialize(name, children)
    @name = name.downcase
    @children = children.sort.map(&:downcase)
  end

  def position
    children.index(name) * COlUMNS_PER_ROW
  end
end