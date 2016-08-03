class Phrase
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def word_count
    word_count = Hash.new(0)

    string.scan(/\w+'?\w+|\w+/) do |word, dict|
      word_count[word.downcase] += 1
    end

    word_count
  end

  def word_count2
    words = string.scan(/\w+'?\w+|\w+/)
    words.each_with_object(Hash.new(0)) do |word, dict|
      dict[word.downcase] += 1
    end
  end

  def word_countOG
    string.split(/\s+|,/).each_with_object(Hash.new(0)) do |word, dict|
      if /[[:alnum:]]/ =~ word
        word = sanitize(word).downcase
        dict[word] += 1
      end
    end
  end

  def sanitize(word)
    word.gsub(/(^\W+|\W+$)/, '')
  end
end