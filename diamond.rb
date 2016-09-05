class Diamond
  def self.make_diamond(letter)
    @letters = [*'A'..letter]
    @half_row_size = @letters.size
    @half_row = ' ' * @half_row_size

    half_rows.concat(half_rows[0...-1].reverse).join("\n") << "\n"
  end

  def self.half_rows
    quadrant_rows.map do |row|
    	row = (row.reverse << row).split('')
    	row.delete_at(@half_row_size)
    	row.join('')
    end
  end

  def self.quadrant_rows
    @letters.map.with_index do |letter, index|
    	half_row = @half_row.dup
    	half_row[index] = letter
    	half_row
    end
  end
end
