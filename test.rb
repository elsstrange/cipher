#!/usr/bin/env ruby

require_relative 'cipher.rb'

char_set1 = Cipher::Codebook.new('character_set_ln.txt').codebook
char_set2 = Cipher::Codebook.new('character_set_ll.txt').codebook
original_plain_text = 'Look over there!'
key = 2374

# Letter Number test case
letter_number_cipher = Cipher::LetterNumber.new(char_set: char_set1, key: key)
p letter_number_cipher.encrypt(original_plain_text) #=> "37141410981421041798190704170452"
p letter_number_cipher.decrypt("37141410981421041798190704170452") #=> 'Look over there!'

# Letter Letter test case
letter_letter_cipher = Cipher::LetterLetter.new(char_set: char_set2)
p letter_letter_cipher.encrypt(original_plain_text) #=> "B!!ym!9DAm2§DAD "
p letter_letter_cipher.decrypt("B!!ym!9DAm2§DAD ") #=> 'Look over there!'

# Encryption suite test case
ciphers = [letter_number_cipher, letter_letter_cipher]
ciphers.each do |cipher|
  cipher_text = cipher.encrypt(original_plain_text)
  plain_text = cipher.decrypt(cipher_text)
  puts "#{cipher.class} encryption: #{original_plain_text == plain_text}"
end