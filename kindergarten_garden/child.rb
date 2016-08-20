class Child
  COlUMNS_PER_ROW = 2

  attr_reader :name, :children

  def initialize(name, children)
    @name = name
    @children = children
  end

  def position
    children.index(name.capitalize) * COlUMNS_PER_ROW
  end
end