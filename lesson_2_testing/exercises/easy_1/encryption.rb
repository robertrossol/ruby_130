
# Write a program that deciphers and prints each of these names. Rot13 encrypted

def decrypt(string)
  string.chars.map do |letter|
    case letter
    when 'a'..'m', 'A'..'M' then (letter.ord + 13).chr
    when 'n'..'z', 'N'..'Z' then (letter.ord - 13).chr
    else letter
    end
  end.join
end

# def decode(str)
#   str.tr('a-zA-z', 'n-za-mN-ZA-M')
# end

ENCRYPTED_PIONEERS = "Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu".split("\n")

ENCRYPTED_PIONEERS.each do |pioneer|
  puts decrypt(pioneer)
end