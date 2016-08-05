class Triangle
  attr_reader :num_rows

  def initialize(num_rows)
    @num_rows = num_rows
  end

  def rows
    return if num_rows < 1

    rows = Array.new(num_rows) { [1] }

    (1...num_rows).each do |n|
      (1...n).each do |idx|
        rows[n] << (rows[n - 1][idx - 1] + rows[n - 1][idx])
      end

      rows[n] << 1
    end

    rows
  end
end
