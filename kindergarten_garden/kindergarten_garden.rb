class Garden
  PLANTS = {clover: 'C', grass: 'G', radishes: 'R', violets: 'V' }.freeze
  CHILDS_COlUMNS_PER_ROW = 2

  attr_reader :plant_rows, :children

  def initialize(plant_rows, children = %w(
      Alice Bob Charlie David Eve Fred Ginny
      Harriet Ileana Joseph Kincaid Larry
    ))

    @plant_rows = plant_rows
    @children = children.sort.map(&:downcase)
    @children.each do |name|
      define_singleton_method(name) { childs_plants(name) }
    end
  end

  private

  def childs_plants(name)
    position = children.index(name) * CHILDS_COlUMNS_PER_ROW

    childs_cups = plant_rows.each_line.inject('') do |cups, row|
      cups << row.slice(position, CHILDS_COlUMNS_PER_ROW)
    end

    childs_cups.chars.map { |cup| PLANTS.key(cup) }
  end
end
