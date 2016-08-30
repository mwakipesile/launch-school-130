# Archiving program that stores students' names along with grades they are in.
class School
  attr_accessor :students

  def initialize
    @students = Hash.new { |roster, grade| roster[grade] = [] }
  end

  def to_h
    students.sort.to_h
  end

  def add(student, grade)
    (students[grade] << student).sort!
  end

  def grade(number)
    students[number]
  end
end
