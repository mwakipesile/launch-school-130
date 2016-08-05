class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def match(words_array)
    words_array.select do |word|
      anagram?(word)
    end
  end

  def anagram?(str)
    str = str.downcase
    match_word = word.downcase

    return if str == match_word
    str.split('').sort == match_word.split('').sort
  end
end