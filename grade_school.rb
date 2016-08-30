# Archiving program that stores students' names along with grades they are in.
class School
  attr_accessor :students

  def initialize
    @students = {
      1 => [], 2 => [], 3 => [], 4 => [], 5 => [], 6 => [], 7 => [], 8 => []
    }
  end

  def to_h
    (1..8).each.with_object({}) do |grade, school|
      school[grade] = students[grade].sort unless students[grade].empty?
    end
  end

  def add(student, grade)
    students[grade] << student
  end

  def grade(number)
    students[number]
  end
end
