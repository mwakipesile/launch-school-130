class WordProblem
  OPERATOR_DICTIONARY = {
    'plus' => '+', 'minus' => '-', 'multiplied' => '*', 'divided' => '/'
  }.freeze

  attr_reader :question

  def initialize(question)
    @question = question
  end

  def answer
    numbers = question.scan(/-?\d+/).map(&:to_i)
    operators = translate_operators

    raise ArgumentError if numbers.size < 2 || operators.empty?

    first_number = numbers.shift
    numbers.inject(first_number) { |a, e| a.send(operators.shift, e) }
  end

  def translate_operators
    question.split.select { |word| OPERATOR_DICTIONARY.key?(word) }
            .map { |word| OPERATOR_DICTIONARY[word] }
  end
end
