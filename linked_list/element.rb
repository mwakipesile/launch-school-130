# Collaborator class for simple linked list class
class Element
  attr_reader :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    self.next.nil?
  end
end
