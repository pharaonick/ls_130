KEY = {
  'a' => 'n',
  'b' => 'o',
  'c' => 'p',
  'd' => 'q',
  'e' => 'r',
  'f' => 's', 
  'g' => 't',
  'h' => 'u',
  'i' => 'v',
  'j' => 'w',
  'k' => 'x',
  'l' => 'y',
  'm' => 'z'
}

ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

def decrypt(str)
  decrypted = str.gsub(/\w/) do |w|
    w.downcase!
    if KEY.key?(w)
      KEY[w]
    else
      KEY.key(w)
    end
  end
  fix_case(str, decrypted)
end

def fix_case(original, decrypted)
  original.each_char.with_index do |char, idx|
    decrypted[idx] = decrypted[idx].upcase if char == char.upcase
  end
  decrypted
end

ENCRYPTED_PIONEERS.each do |name|
  puts decrypt(name)
end
