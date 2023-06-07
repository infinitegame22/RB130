=begin 
Write a program that deciphers and prints each of these names.

input: array of encrypted names
output: each string of unencrypted name

Goal: intake a list of encrypted arrays, and 

=end

# ENCRYPTED_PIONEERS = [Nqn Ybirynpr,
  # Tenpr Ubccre,
  # Nqryr Tbyqfgvar,
  # Nyna Ghevat,
  # Puneyrf Onoontr,
  # Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv,
  # Wbua Ngnanfbss,
  # Ybvf Unvog,
  # Pynhqr Funaaba,
  # Fgrir Wbof,
  # Ovyy Tngrf,
  # Gvz Orearef-Yrr,
  # Fgrir Jbmavnx,
  # Xbaenq Mhfr,
  # Fve Nagbal Ubner,
  # Zneiva Zvafxl,
  # Lhxvuveb Zngfhzbgb,
  # Unllvz Fybavzfxv,
  # Tregehqr Oynapu]

=begin

The following list contains the names of individuals who are pioneers in the field of computing or that have had a significant influence on the field. The names are in an encrypted form, though, using a simple (and incredibly weak) form of encryption called Rot13.

input: an array of strings encrypted
output: each string unencrypted

Goal: We need to unscramble these people's names using the ROT13 process.

Rules:
- each letter is replaced by the letter 13 characters away from it
- dealing with lower and uppercase
- no special characters

E:
Nqn Ybirynpr
index - 13 = new letter
in alpha array, N is at index 13, replaced with A at index 0
 13-13 % 26 = 0
 16-13 % 26 = 3 >> D


Ada Lovelace

D:
arrays of alphabet >> unencrypted string

A:
- initialize our alphabet lowercase and uppercase
- iterate over the elements of the array ENCRYPTED_PIONEERS
  - for each name, we need to replace the chracters with the character 13 indices away from it
    - transform each first and last name to the correct set of letters

- output the name


=end

ENCRYPTED_PIONEERS = ['Nqn Ybirynpr',
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
'Tregehqr Oynapu']

ENCRYPTED_PIONEERS.each {|name| p name}