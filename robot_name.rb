# A simple Robot names class
class Robot
  @names = []
  attr_accessor :name

  def initialize
    @name = assign_name
    self.class.save_in_assigned_robots_names(@name)
  end

  def assign_name
    loop do
      name = [*'A000'..'ZZ999'].sample
      return name unless self.class.names.include?(name)
    end
  end

  def reset
    old_name = name
    self.name = assign_name
    self.class.save_in_assigned_robots_names(name)
    self.class.names.delete(old_name)
  end

  def self.names
    @names
  end

  def self.save_in_assigned_robots_names(name)
    @names << name
  end
end
