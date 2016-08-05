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

    raise ArgumentError if numbers.size < 2 || operators.size < 1

    number = numbers.shift
    numbers.inject(number) { |sum, num| sum.send(operators.shift, num) }
  end

  def translate_operators
    question.split.collect do |word|
      OPERATOR_DICTIONARY[word] if OPERATOR_DICTIONARY.key?(word)
    end.compact
  end
end
