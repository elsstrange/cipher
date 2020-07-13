#!/usr/bin/env ruby

require_relative 'cipher.rb'

# The expected order of the command line arguments are [cipher] [method] [file] and optionally a [key] for use with the LetterNumber cipher
instructions = "Provide cipher (ln/ll), method (enc/dec), file and an optional key for ln cipher."


if ARGV.length < 3
    # Exit program if insufficient arguments have been given.
    abort("Too few arguments provided. #{instructions}")
end

# Prepare a cipher
if ARGV[0] == "ln"
    # If LetterNumber specified, generate a LetterNumber cipher.  If a valid key is not specified, default to 0.
    begin
        key = ARGV[3].to_i  
    rescue # Consider adding some specific error handling, but defaulting to 0 also seems valid.
        key = 0
    end
    codebook = Cipher::Codebook.new('character_set_ln.txt').codebook
    cipher = Cipher::LetterNumber.new(char_set: codebook, key: key)
    
elsif ARGV[0] == "ll"
    # If LetterLetter specified, generate a LetterLetter cipher. No key is required.
    codebook = Cipher::Codebook.new('character_set_ll.txt').codebook
    cipher = Cipher::LetterLetter.new(char_set: codebook)

else
    # Exit program if it is unclear which cipher to use.
    abort("Unclear cipher request. #{instructions}")
end


# Run encrypt / decrypt

if ARGV[1] == "enc"
    plain_text = File.readlines(ARGV[2], encoding:"UTF-8", chomp: true) # Should probably add some error handling for not being able to find the file!
    plain_text.map {|line| puts cipher.encrypt(line)}
elsif ARGV[1] == "dec"
    cipher_text = File.readlines(ARGV[2], encoding:"UTF-8", chomp: true) # Should probably add some error handling for not being able to find the file!
    cipher_text.map {|line| puts cipher.decrypt(line)}
else
    abort("Unclear method request. #{instructions}")
end