class InvalidCodonError < StandardError; end

class Translation
  STOP = 'STOP'.freeze
  PROTEIN = {
    AUG: 'Methionine',      UCG: 'Serine',  UAU: 'Tyrosine',  UAA: 'STOP',
    UUC: 'Phenylalanine',   UCC: 'Serine',  UAC: 'Tyrosine',  UAG:	'STOP',
    UUU: 'Phenylalanine',   UCU: 'Serine',  UGU: 'Cysteine',  UGA:	'STOP',
    UGG: 'Tryptophan',      UCA: 'Serine',  UUG: 'Leucine',   UUA: 'Leucine',
    UGC: 'Cysteine',
  }.freeze

  def self.of_codon(codon)
    PROTEIN.fetch(codon.to_sym) { raise InvalidCodonError }
  end

  def self.of_rna(strand)
    strand.scan(/.{3}/).each_with_object([]) do |codon, protein|
      return protein if stop?(codon)
      protein << of_codon(codon)
    end
  end

  def self.stop?(codon)
    of_codon(codon) == STOP
  end
end
