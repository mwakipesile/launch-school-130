# Run length encoding class
class RunLengthEncoding
  def self.encode(input)
    input.scan(/((.)\2*)/).map do |arr|
      arr.first.size > 1 ? "#{arr.first.size}#{arr.last}" : arr.first
    end.join
  end

  def self.decode(input)
    input.scan(/\d+.|./).map { |e| e.size > 1 ? e.slice!(-1) * e.to_i : e }.join
  end
end

# Best solution, from Launch School
module RunLengthEncoding2
  def self.encode(input)
    input.gsub(/(.)\1{1,}/) { |match| match.size.to_s + match[0] }
    # Alternatively, gsub(/(.)\1+/)
  end

  def self.decode(input)
    input.gsub(/\d+\D/) { |match| match[-1] * match.to_i }
  end
end
