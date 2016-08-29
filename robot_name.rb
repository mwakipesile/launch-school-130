# A simple Robot names class
class Robot
  @names = []
  class << self; attr_accessor :names; end
  attr_accessor :name

  def initialize
    @name = assign_name
    self.class.names << @name
  end

  def assign_name
    loop do
      name = [*'AA000'..'ZZ999'].sample
      return name unless self.class.names.include?(name)
    end
  end

  def reset
    old_name = name
    self.name = assign_name
    self.class.names << name
    self.class.names.delete(old_name)
  end
end
