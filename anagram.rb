class Anagram
  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end

  def match(words_array)
    words_array.select { |word| anagram?(word) }
  end

  def anagram?(str)
    str = str.downcase
    return if str == word || str.size != word.size
    str.chars.sort == word.chars.sort
  end
end