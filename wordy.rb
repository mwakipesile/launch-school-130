class WordProblem
  OPERATORS = {
    'plus' => '+', 'minus' => '-', 'multiplied' => '*', 'divided' => '/'
  }.freeze

  attr_reader :parts

  def initialize(question)
    @parts = question.scan(/-?\d+|plus|minus|divided|multiplied/)
  end

  def answer
    num_operators = parts.select { |word| OPERATORS.key?(word) }.size
    raise ArgumentError if num_operators < 1 || parts.size - num_operators < 1

    number = parts.shift.to_i
    parts.each_slice(2)
         .inject(number) { |sum, (word, n)| sum.send(OPERATORS[word], n.to_i) }
  end
end
