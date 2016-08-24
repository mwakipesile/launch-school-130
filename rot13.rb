PIONEERS = %(
  Nqn Ybirynpr
  Tenpr Ubccre
  Nqryr Tbyqfgvar
  Nyna Ghevat
  Puneyrf Onoontr
  Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
  Wbua Ngnanfbss
  Ybvf Unyog
  Pynhqr Funaaba
  Fgrir Wbof
  Ovyy Tngrf
  Gvz Orearef-Yrr
  Fgrir Jbmavnx
  Xbaenq Mhfr
  Wbua Ngnanfbss
  Fve Nagbal Ubner
  Zneiva Zvafxl
  Lhxvuveb Zngfhzbgb
  Unllvz Fybavzfxv
  Tregehqr Oynapu
).freeze

OFFSET = 13
A_CODE = 'a'.ord
ALPHA_COUNT = 26

def decrypt_lines(string)
  string.each_line.with_object('') { |name, names| names << decrypt(name) }
end

def decrypt(string)
  string.each_char.map { |char| alpha_offset(char) }.join
end

def alpha_offset(char)
  return char unless ('a'..'z').cover?(char.downcase)

  new_char = ((char.downcase.ord + OFFSET - A_CODE) % ALPHA_COUNT + A_CODE).chr
  char < 'a' ? new_char.upcase : new_char
end

puts decrypt_lines(PIONEERS)
