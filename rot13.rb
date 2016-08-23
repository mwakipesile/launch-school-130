encrypted_names = "Nqn Ybirynpr
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
Tregehqr Oynapu"

def names(string)
  string.each_line.with_object('') { |name, names| names << decrypt(name) }
end

def decrypt(string)
  string.each_char.map do |char|
    char = ((char.ord + 13 - 'a'.ord) % 26 + 'a'.ord).chr if ("a".."z").cover?(char)
    char = ((char.ord + 13 - 'A'.ord) % 26 + 'A'.ord).chr if ("A".."Z").cover?(char)
    char
  end.join
end

puts names(encrypted_names)