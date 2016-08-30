class PigLatin
  def self.translate(string)
    string.split(' ').map do |word|
      first_vowel_index = /[uxy][^aeiou]|[aeio]/ =~ word
      "#{word[first_vowel_index..-1]}#{word[0...first_vowel_index]}ay"
    end.join(' ')
  end
end