#!/usr/bin/env ruby

require_relative 'cipher.rb'

# The expected order of the command line arguments are [cipher] [method] [file] and optionally a [key] for use with the LetterNumber cipher
instructions = "Provide cipher (ln/ll), method (enc/dec), file and an optional key for ln cipher."


if ARGV.length < 3
    puts "Too few arguments provided. #{instructions}"
end

# Prepare a codebook
if ARGV[0] == "ln"
    puts "prep ln codebook"
elsif ARGV[0] == "ll"
    puts "prep ll codebook"
else
    puts "Unclear cipher request. #{instructions}"
end


# Run encrypt / decrypt

if ARGV[1] == "enc"
    puts "encrypting"
elsif ARGV[1] == "dec"
    puts "decrypting"
else
    puts "Unclear method request. #{instructions}"
end