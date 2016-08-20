require_relative 'plant'
require_relative 'child'

class Garden
  include Plant

  attr_reader :plant_rows

  def initialize(plant_rows, children = nil)
    @plant_rows = plant_rows
    children ||= %w(
      Alice Bob Charlie David Eve Fred Ginny
      Harriet Ileana Joseph Kincaid Larry
    )

    children.map(&:downcase).each do |name|
      define_singleton_method(name) do
        instance_variable_set("@#{name}", Child.new(name, children))
        childs_plants(instance_variable_get("@#{name}").position)
      end
    end
  end

  private

  def childs_plants(position)
    childs_cups = plant_rows.each_line.inject('') do |cups, row|
      cups << row.slice(position, Child::COlUMNS_PER_ROW)
    end

    childs_cups.chars.map { |cup| PLANTS.key(cup) }
  end
end
