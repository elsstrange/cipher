#!/usr/bin/env ruby

module Cipher
  # Methods that are common to the different Cipher classes below. In the wild, these functions might be saved in a separate module to the classes that include them.
  
  def encrypt(strng)
    # Passes each character of a string to a Hash to look up a corresponding ciphertext character, returning a string.
    strng.chars.map {|c| @encrypt_hsh[c]}.join
  end

  def make_decrypt_hsh
    # Inverts the keys and values of the encrypt hash for the class instance.
    @encrypt_hsh.each_pair.map {|key,value| [value,key]}.to_h    
  end

  def decrypt(strng)
    # Although this method is only used by the LetterLetter class, I've chosen to make it part of the module, as I envisage LetterNumber being a special decryption case, where the number of ciphertext chars per plaintext chars need specifying.
    # Converts each character of a string into its corresponding decoded value from a hash.
    strng.chars.map {|c| @decrypt_hsh[c]}.join
  end
  

  class LetterNumber
    include Cipher

    def initialize(char_set:, key:)
      @encrypt_hsh = make_encrypt_hsh(char_set,key)
      @decrypt_hsh = make_decrypt_hsh
    end

    def decrypt(strng)
      # Converts each consecutive discrete group (of a specified size)of characters in a string into their corresponding decoded value from a hash.
      strng
      .scan(wildcard_regex_by_length)
      .map {|c| @decrypt_hsh[c]}
      .join
    end

    private

    def make_encrypt_hsh(char_set,key)
      # Creates a updated version of the codebook hash, modifying the encoded values by a given value and handling ciphertext character length constraints.
      char_set.transform_values {|value| fix_short(fix_long(value.to_i + key))}
    end

    def fix_short(length=2,num) # 2 ops
      # Takes a specified length and an integer, returning the integer as a string, padded to the specified length with leading zeros.
      num.to_s.rjust(length, "0")
    end

    def fix_long(length=2,num) # 2 ops
      # Takes a specified length and an integer; finds the modulo of the integer divided by the maximum integer with digits equal to the specified length, returning the result (effect is to loop numbers with too many digits back round past 0.)
      num % max_int_by_length(length)
    end

    def max_int_by_length(length=2) # 3 ops
      # Returns the maximum integer (in base 10) with a specified number of digits.
      ("9"*length).to_i
    end
    
    def wildcard_regex_by_length(length=2)
      # Creates a Regular Expression to match a given length of characters.
      Regexp.new("."*length)
    end
  end


  class LetterLetter
    include Cipher

    def initialize(char_set:)
      @encrypt_hsh = char_set
      @decrypt_hsh = make_decrypt_hsh
    end
  end



end