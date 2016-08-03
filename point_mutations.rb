require 'pry'
class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(otherStrand)
    size = [strand.size, otherStrand.size].min
    distance = 0

    (0...size).each do |idx|
      distance += 1 if strand[idx] != otherStrand[idx]
    end

    distance
  end

end