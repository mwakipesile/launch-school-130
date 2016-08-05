require 'pry'

class Crypto
  attr_reader :text, :plaintext, :size

  def initialize(text)
    @text = text
    @plaintext = normalize_plaintext
    @size = (plaintext.size**0.5).ceil
  end

  def normalize_plaintext
    text.gsub(/\W+/, '').downcase
  end

  def plaintext_segments
    plaintext.scan(/\w{1,#{size}}/)
  end

  def ciphertext
    transpose.join
  end

  def normalize_ciphertext
    transpose.join(' ')
  end

  def transpose
    (0...size).map { |idx| plaintext_segments.map { |word| word[idx] }.join }
  end
end
